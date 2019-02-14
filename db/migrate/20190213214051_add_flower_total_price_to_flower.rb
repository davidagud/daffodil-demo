class AddFlowerTotalPriceToFlower < ActiveRecord::Migration[5.2]
  def change
    add_column :flowers, :flower_total_price, :integer
  end
end
