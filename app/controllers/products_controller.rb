# Product  class
class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all.order('name').page(params[:page]).per(5)
    @categories = Category.all
    @order_item = current_order.order_items.new
    retreive_products
  end

  def show
  end

  # def by_category
  #   @products = Product.where()
  # end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  def retreive_products
    if params[:category_id] && params[:search]
      @products = Product.get_by_category_id(params[:category_id])
                         .search(params[:search]).order('created_at DESC')
    elsif params[:search]
      @products = Product.search(params[:search]).order('created_at DESC')
    elsif params[:category_id]
      @products = Product.get_by_category_id(params[:category_id])
                         .order('created_at DESC')
    else
      @product = Product.all.order('created_at DESC')
    end
  end

  def product_params
    params.require(:product).permit(
      :name, :description, :category_id, :price, :quantity
    )
  end
end
