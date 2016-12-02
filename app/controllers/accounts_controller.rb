# asdfja
class AccountsController < ApplicationController
  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    render 'new' unless @account.save
    flash[:success] = 'Account creation successful!'
    redirect_to url_for(controller: :session, action: :new)
  end

  def edit
  end

  def destroy
  end

  private

  def account_params
    params.require(:account).permit(:username, :password)
  end
end
