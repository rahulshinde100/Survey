class CreateGivenAnswers < ActiveRecord::Migration
  def change
    create_table :given_answers do |t|
      t.belongs_to :user, index: true
      t.belongs_to :question, index: true
      t.belongs_to :survey, index: true
      t.text :answer

      t.timestamps
    end
  end
end
