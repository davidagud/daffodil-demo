class ChangeMasterFlowersColumnNames < ActiveRecord::Migration[5.2]
  def change
    rename_column :masterflowers, :flower_name, :masterflower_name
    rename_column :masterflowers, :flower_price, :masterflower_price
  end
end
