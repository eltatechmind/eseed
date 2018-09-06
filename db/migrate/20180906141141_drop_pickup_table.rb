class DropPickupTable < ActiveRecord::Migration[5.2]
 def up
    drop_table :pickups
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
