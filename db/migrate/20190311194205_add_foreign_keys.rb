class AddForeignKeys < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :order_items, :orders, on_delete: :cascade
    add_foreign_key :order_items, :weddings, on_delete: :cascade
  end
end
