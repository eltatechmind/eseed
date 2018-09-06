class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.string :mobile
      t.date :hiredate

      t.timestamps
    end
  end
end
