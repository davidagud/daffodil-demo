class Order < ApplicationRecord
  has_many :order_items
  has_many :weddings, through: :order_items
  has_many :recipes, through: :weddings
  has_many :flowers, through: :weddings
  has_many :hard_goods, through: :weddings

end
