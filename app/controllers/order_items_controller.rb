# orderitem controller
class OrderItemsController < ApplicationController
  before_action :set_current_order
  before_action :check_current_item, only: [:create]
  def create
    if @item
      @item.quantity += params[:order_item][:quantity].to_i
      @item.save
      @order_item = item
    else
      @order_item = @order.order_items.new(order_item_params)
      @order.save
    end
    session[:order_id] ||= @order.id
  end

  def update
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
  end

  def destroy
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end

  private

  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end

  def set_current_order
    @order = current_order
  end

  def check_current_item
    @item = @order.order_items
                  .where('product_id = ?', params[:order_item][:product_id])
                  .first
  end
end
