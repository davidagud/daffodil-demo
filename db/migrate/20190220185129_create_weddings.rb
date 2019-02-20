class CreateWeddings < ActiveRecord::Migration[5.2]
  def change
    create_table :weddings do |t|
      t.string :wedding_name
      t.date :wedding_date
      t.boolean :completed
      t.integer :total_price

      t.timestamps
    end
  end
end
