class FixAssociations < ActiveRecord::Migration[5.2]
  def change
    remove_reference :weddings, :recipe, index: true, foreign_key: true
    add_reference :recipes, :wedding, foreign_key: true
    remove_reference :recipes, :flower, index: true, foreign_key: true
    add_reference :flowers, :recipe, foreign_key: true
  end
end
