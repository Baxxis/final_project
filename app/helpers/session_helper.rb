module SessionHelper
  def log_in(account)
    session[:user_id] = account.id
  end

  # Returns the current logged-in user (if any).
  def current_account
    @current_account ||= Account.find_by(id: session[:user_id])
  end

  def current_customer
    @current_customer = Customer.find_by(account_id: session[:user_id])
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_account.nil?
  end

  # returns true if the current account has customer data
  def account_customer_info?
    !current_customer.nil?
  end
end
