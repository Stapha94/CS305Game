class CreateFacilitators < ActiveRecord::Migration
  def change
    create_table :facilitators do |t|
      t.string :username
      t.string :passkey
      t.string :report

      t.timestamps null: false
    end
  end
end
