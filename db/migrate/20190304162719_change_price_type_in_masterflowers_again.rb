class ChangePriceTypeInMasterflowersAgain < ActiveRecord::Migration[5.2]
  def change
    change_column :masterflowers, :masterflower_price, :decimal, :precision => 8, :scale => 2
  end
end
