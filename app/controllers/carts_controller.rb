# Carts controller
class CartsController < ApplicationController
  def show
    @order_items = current_order.order_items
  end

  def process_cart
    @order_items = current_order.order_items
    @order = current_order
  end

  def checkout
    redirect_to(controller: :customer, action: :new) if
    account_customer_info?
    @order = current_order
    @amount = @order.subtotal + (@order.subtotal * (@order.pst + @order.gst + @order.hst))
    @description = 'description of charge'
    @order_items = current_order.order_items
    customer = Customer.find(session[:user_id])
    @order.pst = customer.province.pst / 100
    @order.gst = customer.province.gst / 100
    @order.hst = customer.province.hst / 100
    @order.save
  end
end
