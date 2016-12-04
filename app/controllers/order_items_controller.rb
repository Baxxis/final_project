# orderitem controller
class OrderItemsController < ApplicationController
  def create
    @order = current_order
    item = @order.order_items.where(params[:product_id]).first
    if item
      item.quantity += 1
      item.save
      @order_item = item
    else
      @order_item = @order.order_items.new(order_item_params)
      @order.save
    end
    session[:order_id] = @order.id
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end

  private

  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
