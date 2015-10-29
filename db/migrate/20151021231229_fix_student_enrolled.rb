class FixStudentEnrolled < ActiveRecord::Migration
  def change
    change_column :students, :enrolled, :boolean, :default => true
  end
end
