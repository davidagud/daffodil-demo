class ChangeWeddingsDateColumnToInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :weddings, :wedding_date, 'character varying USING CAST(wedding_date AS character varying)'
  end
end
