class ChangePriceTypeInMasterflowers < ActiveRecord::Migration[5.2]
  def change
    change_column :masterflowers, :masterflower_price, :decimal
  end
end
