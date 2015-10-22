class FixDb < ActiveRecord::Migration
  def change
    remove_column :facilitators, :usrname, :string
    remove_column :facilitators, :report, :string
    add_column :facilitators, :email, :string
    add_column :facilitators, :first, :string
    add_column :facilitators, :last, :string
    add_column :facilitators, :active, :boolean, :default => true
    remove_column :admins, :usrname, :string
    remove_column :admins, :authorized, :boolean
    add_column :admins, :email, :string
    add_column :admins, :first, :string
    add_column :admins, :last, :string
    add_column :admins, :acitve, :boolean, :default => true
  end
end
