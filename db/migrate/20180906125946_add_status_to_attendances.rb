class AddStatusToAttendances < ActiveRecord::Migration[5.2]
  def change
    add_column :attendances, :status_id, :integer
    add_index :attendances, :status_id
  end
end
