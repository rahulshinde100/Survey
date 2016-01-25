class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :que_content , null: false
      t.string :types
      t.belongs_to :survey , index: true

      t.timestamps
    end
  end
end
