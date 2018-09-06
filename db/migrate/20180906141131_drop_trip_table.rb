class DropTripTable < ActiveRecord::Migration[5.2]
 def up
    drop_table :trips
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
