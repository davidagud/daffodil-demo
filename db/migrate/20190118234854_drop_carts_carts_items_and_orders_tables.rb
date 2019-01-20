class DropCartsCartsItemsAndOrdersTables < ActiveRecord::Migration[5.2]
  def change
    drop_table :orders
    drop_table :carts
    drop_table :cart_items
  end
end
