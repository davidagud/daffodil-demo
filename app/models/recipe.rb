class Recipe < ApplicationRecord
  belongs_to :wedding
  has_many :flowers, :dependent => :destroy


end
