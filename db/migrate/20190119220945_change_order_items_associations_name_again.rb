class ChangeOrderItemsAssociationsNameAgain < ActiveRecord::Migration[5.2]
  def change
    remove_column :order_items, :wedding_id_id
    add_reference :order_items, :wedding, foreign_key: true
  end
end
