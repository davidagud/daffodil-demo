class Flower < ApplicationRecord
  belongs_to :recipe
  validates :quantity, presence: true

end
