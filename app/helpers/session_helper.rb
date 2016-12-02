module SessionHelper
  def log_in(account)
    session[:user_id] = account.id
  end

  # Returns the current logged-in user (if any).
  def current_account
    @current_account ||= Account.find_by(id: session[:user_id])
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_account.nil?
  end

  def account_customer_info?
    !Customer.find_by(account_id: :user_id).nil?
  end
end
