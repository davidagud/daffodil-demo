class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :recipe_name
      t.string :recipe_ingredient
      t.integer :recipe_quantity

      t.timestamps
    end
  end
end
