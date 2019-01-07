class CreateWeddings < ActiveRecord::Migration[5.2]
  def change
    create_table :weddings do |t|
      t.string :wedding_name
      t.string :wedding_date

      t.timestamps
    end
  end
end
