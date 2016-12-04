# Customer class
class CustomerController < ApplicationController
  def new
    @customer = Customer.new
    @provinces = Province.all
  end

  def create
    customer = Customer.new(customer_params)
    customer.account_id = session[:user_id]
    render 'new' unless customer.save
    redirect_to(controller: :carts, action: :checkout)
  end

  # def update
  # end

  # def destroy
  # end

  private

  def customer_params
    params.require(:customer).permit(:name, :address, :city, :postal_code,
                                     :phone, :email, :province_id)
  end
end
