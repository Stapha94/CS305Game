class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :sid
      t.boolean :enrolled

      t.timestamps null: false
    end
  end
end
