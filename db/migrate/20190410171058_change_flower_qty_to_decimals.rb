class ChangeFlowerQtyToDecimals < ActiveRecord::Migration[5.2]
  def change
    change_column :flowers, :quantity, :decimal, :precision => 8, :scale => 2
  end
end
