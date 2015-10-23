class FixStudentDefaults2 < ActiveRecord::Migration
  def change
	change_column_default :students, :enrolled, true
  end
end
