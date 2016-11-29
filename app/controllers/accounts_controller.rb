class AccountsController < ApplicationController
  def signin
    @account = Accounts.find(params[:id])
  end

  def create
  end

  def update
  end

  def destroy
  end
end
