class Masterflower < ApplicationRecord

  def self.search(search_term)
    search_verb = Rails.env.production? ? "ilike" : "LIKE"
    Masterflower.where("masterflower_name #{search_verb} ?", "%#{search_term}%")
  end

end
