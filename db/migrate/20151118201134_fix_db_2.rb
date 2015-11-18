class FixDb2 < ActiveRecord::Migration
  def change
    remove_column :admins, :acitve, :boolean
    add_column :admins, :active, :boolean, :default => true
  end
end
