class AddTotalPriceColumnToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :recipe_total_price, :integer
  end
end
