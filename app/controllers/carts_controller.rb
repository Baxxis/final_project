# Carts controller
class CartsController < ApplicationController
  include SessionHelper
  def show
    @order_items = current_order.order_items
  end

  def process_cart
    @order_items = current_order.order_items
    @order = current_order
  end

  def checkout
    customer = current_customer
    redirect_to(controller: :customer, action: :new) unless account_customer_info?
    @order = current_order
    @description = 'description of charge'
    @order_items = current_order.order_items
    @order.pst = customer.province.pst / 100
    @order.gst = customer.province.gst / 100
    @order.hst = customer.province.hst / 100
    @amount = @order.subtotal + (@order.subtotal * (@order.pst + @order.gst + @order.hst))
    @order.save
  end
end
