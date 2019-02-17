class AddFlowerVendorToFlowers < ActiveRecord::Migration[5.2]
  def change
    add_column :flowers, :flower_vendor, :string
  end
end
