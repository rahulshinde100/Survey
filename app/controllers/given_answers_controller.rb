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


            #@attempt_questions = GivenAnswer.new(question_attempt_params)
           # @attempt_questions.save






        #raise params.inspect
        total_question = params[:total_question].to_i
          for i in 1..total_question
            if params['types_'+i.to_s]== "checkbox"
              question_answer = params[:given_answer][i.to_s][:answer_options]
              question_answer.delete('0')
              question_answer = question_answer.join('\n')
              @attempt_questions = GivenAnswer.new(:user_id =>current_user.id , :question_id => i , :survey_id => params[:survey_id] , :answer => question_answer)
              @attempt_questions.save   
              else
                question_answer = params[:given_answer][i.to_s][:answer_options]
                @attempt_questions = GivenAnswer.new(:user_id =>current_user.id , :question_id => i , :survey_id => params[:survey_id] , :answer => question_answer)
                @attempt_questions.save
            end
          end
          @survey = Survey.find(params[:survey_id])
          redirect_to survey_given_answers_path(@survey)                 
    end

    def show   
    end

    def question_attempt_params
      params["given_answer"].merge!(user_id: current_user.id)
      raise params[:given_answer].inspect
    
    end   


end
