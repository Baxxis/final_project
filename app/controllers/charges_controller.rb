# Charges controller
class ChargesController < ApplicationController
  include SessionHelper
  def create
    @order = current_order
    @amount = ((@order.subtotal + (@order.subtotal * (@order.pst + @order.gst +
                @order.hst))) * 100).to_i
    @customer = new_stripe_customer
    @charge = new_strip_charge

    require 'date'
    # save stripe customer id with stripe customer!
    if @charge.paid
      @order = current_order
      @order.order_date = DateTime.now
      @order.customer_id = current_customer.id
      @order.order_status_id = 2
      @order.save
      session.delete(:order_id)
      # current_order = Order.new
    end

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
end
