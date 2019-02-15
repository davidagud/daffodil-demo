class FixHardGoodsAssociationAgain < ActiveRecord::Migration[5.2]
  def change
    remove_column :hard_goods, :recipe_id_id
    add_reference :hard_goods, :recipe, foreign_key: true
  end
end
