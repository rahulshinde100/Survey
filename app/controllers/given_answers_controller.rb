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
        total_question=params[:total_questions]

          for i in 1...total_question.to_i+1

            if params['types_'+i.to_s] == "4"
              checkbox_hash=params['answer_'+i.to_s]
                s = checkbox_hash.size
                  question_answer=""  
                  for j in 0...s
                  question_answer =question_answer+'\n '+ checkbox_hash[j].to_s
                   end
                    @attemptquestion = GivenAnswer.new(:user_id =>current_user.id , :question_id => i , :survey_id => params[:survey_id] , :answer => question_answer)
                    @attemptquestion.save
            else
              question_answer = params['answer_'+i.to_s]
              @attemptquestion = GivenAnswer.new(:user_id =>current_user.id , :question_id => i , :survey_id => params[:survey_id] , :answer => question_answer)
              @attemptquestion.save    
            end
          end
          @survey = Survey.find(params[:survey_id])
          @questions = @survey.questions
     # raise @questions.inspect
          redirect_to survey_given_answers_path(@survey)
  end

  def show
    
  end


  end
