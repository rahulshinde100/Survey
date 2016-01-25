module ApplicationHelper

	  def render_answer_form_helper(index,question, form)
      partial = question.types.to_s.downcase
      render partial: "answer_types/#{partial}", locals: {index: index , f: form, answer: question }
    end

    def checkbox_checked?(answer, option)
    	#raise option.inspect
      answers_delimiter = '0'
      answers = answer.que_content.to_s.split(answers_delimiter)
      answers.include?(option)
    end

end
