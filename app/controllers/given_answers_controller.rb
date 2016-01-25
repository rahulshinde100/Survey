class GivenAnswersController < ApplicationController
    before_filter :authenticate_user!, :except => [ :index, :show ]
    def index
    end

    def new
          check = GivenAnswer.find_by(:user_id => current_user.id , :survey_id => params[:survey_id])
          if check.nil?
             @survey = Survey.find(params[:survey_id])
             @givenanswer = GivenAnswer.new  
             @questions = @survey.questions
             else
                 flash[:error]="You already attempt this Survey....!!!"
                 redirect_to surveys_path
          end
    end	

     
    def create

          params[:given_answer].each do |question_id, given_answer_attributes|
              answer=question_attempt_params_check_array_or_not(given_answer_attributes[:answer_options])
              @attempt_questions = GivenAnswer.new(:user_id =>current_user.id , :question_id =>question_id , :survey_id => params[:survey_id] , :answer =>  answer)
              @attempt_questions.save
          end                
    end

    def strip_checkbox_answers(answer)
        answer.reject(&:blank?).reject { |t| t == "0" }
    end
    def show   
    end

    def question_attempt_params_check_array_or_not(answer)
            answer == if answer.is_a?(Array)
                stripped_answers = strip_checkbox_answers(answer)
                answer=stripped_answers.join('\n')
              else
                answer
            end
    
    end   


end
