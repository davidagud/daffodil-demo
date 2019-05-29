class Recipe < ApplicationRecord
  belongs_to :wedding
  has_many :flowers, :dependent => :destroy
  has_many :hard_goods, :dependent => :destroy
  validates :recipe_name, presence: true
  validates :recipe_quantity, presence: true

end
