class AddInChargeToFacilitators < ActiveRecord::Migration
  def change
    add_column :facilitators, :in_charge, :boolean
  end
end
