class HardGood < ApplicationRecord
  belongs_to :recipe
  validates :hard_good_name, presence: true
  validates :hard_good_price, presence: true
  validates :hard_good_quantity, presence: true

end
