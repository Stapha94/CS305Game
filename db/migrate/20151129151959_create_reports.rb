class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :sid, null: false
      t.integer :chapter, null: false
      t.integer :score, null: false, default: 0
      t.integer :grade, null: false, default: 0

      t.timestamps null: false
    end
  end
end
