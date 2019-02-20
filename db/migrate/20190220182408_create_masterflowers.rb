class CreateMasterflowers < ActiveRecord::Migration[5.2]
  def change
    create_table :masterflowers do |t|
      t.string :masterflower_name
      t.integer :masterflower_price
      t.string :vendor

      t.timestamps
    end
  end
end
