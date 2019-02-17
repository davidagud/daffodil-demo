class RemoveRetailPriceFromWeddings < ActiveRecord::Migration[5.2]
  def change
    remove_column :weddings, :retail_price
  end
end
