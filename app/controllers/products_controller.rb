# Product  class
class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
    if params[:search]
      @products = Product.search(params[:search]).order('created_at DESC')
    else
      @product = Product.all.order('created_at DESC')
    end
  end

  def show
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(
      :name, :description, :category_id, :price, :quantity
    )
  end
end
