class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :sid, null: false
      t.integer :qid, null: false
      t.string :student_answer

      t.timestamps null: false
    end

  add_index :answers, :sid
  add_index :answers, :qid
  end
end
