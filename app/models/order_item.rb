# order_item class
class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :quantity, presence: true, numericality: { only_integer: true,
                                                       greater_than: 0 }
  validate :product_present
  validate :order_present

  before_save :finalize

  def unit_price
    if persisted?
      self[:price]
    else
      product.price
    end
  end

  def total_price
    unit_price * quantity
  end

  private

  def order_present
    errors.add(:order, 'is not a valid order.') if order.nil?
  end

  def product_present
    errors.add(:product, 'is not a valid product.') if product.nil?
  end

  def finalize
    self[:price] = unit_price
  end
end
