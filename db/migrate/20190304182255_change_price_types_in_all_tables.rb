class ChangePriceTypesInAllTables < ActiveRecord::Migration[5.2]
  def change
    change_column :flowers, :flower_price, :decimal, :precision => 8, :scale => 2
    change_column :flowers, :flower_total_price, :decimal, :precision => 8, :scale => 2
    change_column :hard_goods, :hard_good_price, :decimal, :precision => 8, :scale => 2
    change_column :hard_goods, :hard_good_total_price, :decimal, :precision => 8, :scale => 2
    change_column :recipes, :retail_price, :decimal, :precision => 8, :scale => 2
    change_column :recipes, :recipe_total_price, :decimal, :precision => 8, :scale => 2
    change_column :weddings, :total_price, :decimal, :precision => 8, :scale => 2
  end
end
