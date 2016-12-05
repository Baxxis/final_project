# Carts controller
class CartsController < ApplicationController
  before_action :set_current_order
  before_action :calculate_amount, only: [:checkout, :calculate_amount,
                                          :update_order]
  include SessionHelper
  def show
    @order_items = current_order.order_items
  end

  def process_cart
    @order_items = current_order.order_items
  end

  def checkout
    if account_customer_info?
      update_order
    else
      redirect_to(controller: :customer, action: :new)
    end
  end

  def update_order
    customer = current_customer
    @description = 'description of charge'
    @order.update(pst: customer.province.pst / 100,
                  gst: customer.province.gst / 100,
                  hst: customer.province.hst / 100)
    @order_items = current_order.order_items
    @order.save
  end

  def set_current_order
    @order = current_order
  end

  def calculate_amount
    @amount = @order.subtotal + (@order.subtotal * (@order.pst + @order.gst +
              @order.hst))
  end
end
