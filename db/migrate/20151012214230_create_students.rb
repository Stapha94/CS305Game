class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :sid
<<<<<<< HEAD
      t.string :passkey
=======
>>>>>>> Paul's_Branch
      t.integer :ch1
      t.integer :ch2
      t.integer :ch4
      t.integer :ch6
      t.integer :ch7
      t.boolean :enrolled

      t.timestamps null: false
    end
  end
<<<<<<< HEAD
end
=======
end
>>>>>>> Paul's_Branch
