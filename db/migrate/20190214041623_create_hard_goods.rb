class CreateHardGoods < ActiveRecord::Migration[5.2]
  def change
    create_table :hard_goods do |t|
      t.string :hard_good_name
      t.integer :hard_good_quantity
      t.integer :hard_good_price
      t.integer :hard_good_total_price
      t.references :recipes, foreign_key: true

      t.timestamps
    end
  end
end
