class AddRetailPriceToRecipe < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :retail_price, :integer
  end
end
