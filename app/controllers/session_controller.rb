# Session Controller
class SessionController < ApplicationController
  def new
    render 'checkout' if session[:user_id]
  end

  def create
    account = Account.find_by(username: params[:session][:username].downcase)
    if account && account.password == params[:session][:password]
      log_in account
      redirect_to url_for(controller: :carts, action: :process_cart)
    else
      flash[:danger] = 'Invalid username/password combination' # Not quite right!
      # flash[:danger] = params[:username]
      # flash[:danger] = params[:password]
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil unless session[:user_id].nil?
    redirect_to(controller: :products, action: :index)
  end
end
