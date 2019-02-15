class FixHardGoodsAssociation < ActiveRecord::Migration[5.2]
  def change
    remove_column :hard_goods, :recipes_id
    add_reference :hard_goods, :recipe_id, foreign_key: true
  end
end
