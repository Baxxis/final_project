# Product  class
class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :retrieve_categories, only: [:index, :by_categroy]

  def index
    @products = Product.all.order('name').page(params[:page]).per(5)
    @order_item = current_order.order_items.new
    @products = retreive_products
  end

  def by_category
    @products = Category.where("name LIKE '#{params[:name]}'").first.products
                        .order('name')
                        .page(params[:page]).per(5)
    @order_item = current_order.order_items.new
    render 'index'
  end

  def show() end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  def retreive_products
    if !params[:category_id].to_i.zero? && params[:search]
      @produes = full_search
    elsif params[:search]
      @products = text_search
    elsif params[:category_id]
      @products = category_search
    else
      @products = Product.all.order('created_at DESC')
    end
  end

  def product_params
    params.require(:product).permit(
      :name, :description, :category_id, :price, :quantity
    )
  end

  def retrieve_categories
    @categories = Category.all
  end

  def full_search
    @products = Product.get_by_category_id(params[:category_id])
                       .search(params[:search]).order('created_at DESC')
                       .page(params[:page]).per(5)
  end

  def text_search
    @products = Product.search(params[:search]).order('created_at DESC')
                       .page(params[:page]).per(5)
  end

  def category_search
    @products = Product.get_by_category_id(params[:category_id])
                       .order('created_at DESC')
                       .page(params[:page]).per(5)
  end
end
