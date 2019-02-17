class AddVendorToMasterflowers < ActiveRecord::Migration[5.2]
  def change
    add_column :masterflowers, :vendor, :string
  end
end
