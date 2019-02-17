class AddRetailPriceToWeddings < ActiveRecord::Migration[5.2]
  def change
    add_column :weddings, :retail_price, :integer
  end
end
