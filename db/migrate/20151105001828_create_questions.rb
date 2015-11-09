class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :qid, null: false
      t.integer :chapter, null: false
      t.string :answer, null: false
      t.string :description, null: false
 
      t.timestamps null: false
    end
  end
end
