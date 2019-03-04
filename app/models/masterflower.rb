class Masterflower < ApplicationRecord
  validates_uniqueness_of :masterflower_name, :case_sensitive => false
  validates :masterflower_price, presence: true

  def self.search(search_term)
    Masterflower.where("masterflower_name ilike ?", "%#{search_term}%")
  end

  def self.find_price(flowerprice)
    @masterflowers = Masterflower.all
    masterflower_id = @masterflowers.where("masterflower_name ilike ?", "#{flowerprice}").first.id
    @masterflowers.find(masterflower_id).masterflower_price
  end

  def self.find_vendor(flower_vendor)
    @masterflowers = Masterflower.all
    masterflower_id = @masterflowers.where("masterflower_name ilike ?", "#{flower_vendor}").first.id
    @masterflowers.find(masterflower_id).vendor
  end

end
