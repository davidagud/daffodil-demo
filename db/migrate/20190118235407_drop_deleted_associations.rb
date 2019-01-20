class DropDeletedAssociations < ActiveRecord::Migration[5.2]
  def change
    remove_column :flowers, :order_id
    remove_column :recipes, :order_id
    remove_column :weddings, :order_id
  end
end
