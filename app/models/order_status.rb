# order status class
class OrderStatus < ApplicationRecord
  has_many :orders
end
