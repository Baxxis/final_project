# order class
class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :order_status
  has_many :order_items

  def subtotal
    order_items.collect { |item| item.valid? ? (item.quantity * item.price) : 0}
               .sum
  end

  private

  def set_order_status
    self.order_status = 1
  end
end
