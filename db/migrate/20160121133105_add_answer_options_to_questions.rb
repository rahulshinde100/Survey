class AddAnswerOptionsToQuestions < ActiveRecord::Migration
  def change
  	add_column :questions, :answer_options, :text
  end
end
