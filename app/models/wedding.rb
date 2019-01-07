class Wedding < ApplicationRecord
  has_many :recipes, :dependent => :destroy
  has_many :flowers, through: :recipes, :dependent => :destroy

end
