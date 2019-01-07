class DropTableFlowersWeddings < ActiveRecord::Migration[5.2]
  def change
    drop_table :flowers_weddings
  end
end
