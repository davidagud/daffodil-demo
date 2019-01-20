class RemoveOrderStatus < ActiveRecord::Migration[5.2]
  def change
    drop_table :order_statuses
    remove_column :orders, :order_status_id
  end
end
