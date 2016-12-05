# Charges controller
class ChargesController < ApplicationController
  include SessionHelper
  before_action :set_current_order
  before_action :set_amount
  require 'date'

  def create
    @customer = new_stripe_customer
    @charge = new_strip_charge
    session.delete(:order_id) if @charge.paid

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  def new_stripe_customer
    Stripe::Customer.create(email: params[:stripeEmail],
                            source: params[:stripeToken])
  end

  def new_strip_charge
    Stripe::Charge.create(customer: @customer.id,
                          amount: (@amount * 100).to_i,
                          description: 'Rails Stripe Customer',
                          currency: 'cad')
  end

  def update_order
    @order = current_order
    @order.order_date = DateTime.current
    @order.customer_id = current_customer.id
    @order.order_status_id = 2
    @order.save
  end

  def set_current_order
    @order = current_order
  end

  def set_amount
    @amount = ((@order.subtotal + (@order.subtotal * (@order.pst + @order.gst +
                @order.hst))) * 100).to_i
  end
end
