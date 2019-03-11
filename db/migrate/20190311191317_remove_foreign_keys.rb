class RemoveForeignKeys < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :order_items, :orders
    remove_foreign_key :order_items, :weddings
  end
end
