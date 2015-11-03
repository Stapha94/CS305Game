class AddSecQuestion < ActiveRecord::Migration
  def change
    add_column :facilitators, :squestion, :string
    add_column :facilitators, :sanswer, :string
    add_column :admins, :squestion, :string
    add_column :admins, :sanswer, :string
  end
end
