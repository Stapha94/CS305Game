class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :email
      t.string :first
      t.string :last
      t.string :password_digest
      t.boolean :active

      t.timestamps null: false
    end
  end
end
