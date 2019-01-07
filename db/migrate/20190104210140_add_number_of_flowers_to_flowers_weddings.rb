class AddNumberOfFlowersToFlowersWeddings < ActiveRecord::Migration[5.2]
  def change
    add_column :flowers_weddings, :number_of_flowers, :integer
  end
end
