class ChangeDateToDateType < ActiveRecord::Migration[5.2]
  def change
    change_column :weddings, :wedding_date, :date
  end
end
