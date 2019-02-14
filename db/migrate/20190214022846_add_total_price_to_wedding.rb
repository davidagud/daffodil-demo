class AddTotalPriceToWedding < ActiveRecord::Migration[5.2]
  def change
    add_column :weddings, :total_price, :integer
  end
end
