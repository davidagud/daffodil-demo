class AddCompletedToWeddings < ActiveRecord::Migration[5.2]
  def change
    add_column :weddings, :completed, :boolean, default: false
  end
end
