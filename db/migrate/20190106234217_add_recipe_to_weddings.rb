class AddRecipeToWeddings < ActiveRecord::Migration[5.2]
  def change
    add_reference :weddings, :recipe, foreign_key: true
  end
end
