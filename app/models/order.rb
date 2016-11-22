# order class
class Order < ApplicationRecord
  belongs_to :customer
  before_create :set_order_status
  belongs_to :order_status
  has_many :order_items
  before_save :update_subtotal

  def subtotal
    order_items
      .collect { |item| item.valid? ? (item.quantity.to_i * item.unit_price.to_f) : 0 }
      .sum
  end

  private

  def set_order_status
    self.order_status_id = 1
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end
end
