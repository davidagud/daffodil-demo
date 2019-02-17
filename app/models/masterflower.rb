class Masterflower < ApplicationRecord

  def self.search(search_term)
    search_verb = Rails.env.production? ? "ilike" : "LIKE"
    Masterflower.where("masterflower_name #{search_verb} ?", "%#{search_term}%")
  end

  def self.find_price(flowerprice)
    @masterflowers = Masterflower.all
    masterflower_id = @masterflowers.where("masterflower_name == '#{flowerprice}'").first.id
    @masterflowers.find(masterflower_id).masterflower_price
  end

  def self.find_vendor(flower_vendor)
    @masterflowers = Masterflower.all
    masterflower_id = @masterflowers.where("masterflower_name == '#{flower_vendor}'").first.id
    @masterflowers.find(masterflower_id).vendor
  end

end
