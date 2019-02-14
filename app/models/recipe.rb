class Recipe < ApplicationRecord
  belongs_to :wedding
  has_many :flowers, :dependent => :destroy
  has_many :hard_goods, :dependent => :destroy

end
