class DropPlacesTable < ActiveRecord::Migration[5.2]
 def up
    drop_table :places
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
