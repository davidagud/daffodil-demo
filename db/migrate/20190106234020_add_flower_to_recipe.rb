class AddFlowerToRecipe < ActiveRecord::Migration[5.2]
  def change
    add_reference :recipes, :flower, foreign_key: true
  end
end
