class AddEmployeeToAttendances < ActiveRecord::Migration[5.2]
  def change
    add_column :attendances, :employee_id, :integer
    add_index :attendances, :employee_id
  end
end
