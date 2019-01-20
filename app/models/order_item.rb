class OrderItem < ApplicationRecord
  belongs_to :wedding
  belongs_to :order

  validate :wedding_present
  validate :order_present

private
  def wedding_present
    if wedding.nil?
      errors.add(:wedding, "is not valid.")
    end
  end

  def order_present
    if order.nil?
      errors.add(:order, "is not a valid order.")
    end
  end

end
