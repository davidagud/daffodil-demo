class AddFlowerPriceToFlowers < ActiveRecord::Migration[5.2]
  def change
    add_column :flowers, :flower_price, :integer
  end
end
