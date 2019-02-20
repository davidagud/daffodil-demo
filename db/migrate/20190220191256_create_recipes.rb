class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :recipe_name
      t.string :recipe_ingredient
      t.integer :recipe_quantity
      t.integer :recipe_total_price
      t.integer :retail_price
      t.text :notes
      t.references :wedding

      t.timestamps
    end
  end
end
