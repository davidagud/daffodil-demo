class ChangeFlowersTableToMasterFlowers < ActiveRecord::Migration[5.2]
  def change
    rename_table :flowers, :masterflowers
  end
end
