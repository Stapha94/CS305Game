class FixAdmin < ActiveRecord::Migration
  def change
   rename_column :admins, :passkey, :password_digest
  end
end
