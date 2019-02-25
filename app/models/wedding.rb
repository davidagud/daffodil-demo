class Wedding < ApplicationRecord
  belongs_to :order, optional: true
  has_many :recipes, :dependent => :destroy
  has_many :flowers, through: :recipes, :dependent => :destroy
  has_many :hard_goods, through: :recipes, :dependent => :destroy

  def self.filter(status)
    Wedding.where("completed = ?", status)
  end

  def self.search(search_term)
    Wedding.where("wedding_name ilike ?", "%#{search_term}%")
  end

  def self.date_search(search_date)
    Wedding.where("CAST (wedding_date AS character varying) ilike ?", "%#{search_date}%")
  end

end
