class ChangeHardgoodQtyToDecimals < ActiveRecord::Migration[5.2]
  def change
    change_column :hard_goods, :hard_good_quantity, :decimal, :precision => 8, :scale => 2
  end
end
