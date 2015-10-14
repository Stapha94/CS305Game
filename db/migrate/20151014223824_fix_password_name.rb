class FixPasswordName < ActiveRecord::Migration
  def change
    rename_column :facilitators, :passkey, :password_digest
  end
end
