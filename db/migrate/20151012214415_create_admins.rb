class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :usrname
      t.string :passkey
      t.boolean :authorized

      t.timestamps null: false
    end
  end
<<<<<<< HEAD
end
=======
end
>>>>>>> Paul's_Branch
