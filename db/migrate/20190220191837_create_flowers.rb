class CreateFlowers < ActiveRecord::Migration[5.2]
  def change
    create_table :flowers do |t|
      t.string :flower_name
      t.string :quantity
      t.integer :recipe_id
      t.integer :flower_price
      t.integer :flower_total_price
      t.string :flower_vendor
      t.references :recipe

      t.timestamps
    end
  end
end
