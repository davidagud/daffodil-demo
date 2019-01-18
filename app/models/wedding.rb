class Wedding < ApplicationRecord
  has_many :recipes, :dependent => :destroy
  has_many :flowers, through: :recipes, :dependent => :destroy

  def self.filter(status)
    Wedding.where("completed == #{status}")
  end

  def self.search(search_term)
    search_verb = Rails.env.production? ? "ilike" : "LIKE"
    Wedding.where("wedding_name #{search_verb} ?", "%#{search_term}%")
  end

end
