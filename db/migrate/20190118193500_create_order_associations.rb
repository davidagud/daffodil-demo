class CreateOrderAssociations < ActiveRecord::Migration[5.2]
  def change
    add_reference :weddings, :order, foreign_key: true
    add_reference :recipes, :order, foreign_key: true
    add_reference :flowers, :order, foreign_key: true
  end
end
