class ChangeWeddingsDateColumnToDate < ActiveRecord::Migration[5.2]
  def change
    change_column :weddings, :wedding_date, 'date USING CAST(wedding_date AS date)'
  end
end
