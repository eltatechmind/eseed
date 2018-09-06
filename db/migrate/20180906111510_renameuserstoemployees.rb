class Renameuserstoemployees < ActiveRecord::Migration[5.2]
  def self.up
    rename_table :users, :employees
  end

  def self.down
    rename_table :employees, :users
  end
end
