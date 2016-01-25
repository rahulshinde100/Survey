class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.text :ans_content
      t.belongs_to :question ,  index: true
      t.timestamps
    end
  end
end
