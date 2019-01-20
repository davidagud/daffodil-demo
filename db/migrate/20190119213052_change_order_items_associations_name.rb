class ChangeOrderItemsAssociationsName < ActiveRecord::Migration[5.2]
  def change
    remove_column :order_items, :product_id
    add_reference :order_items, :wedding_id, foreign_key: true
  end
end
