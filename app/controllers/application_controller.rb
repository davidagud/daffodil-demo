class ApplicationController < ActionController::Base
  helper_method :current_order
  helper_method :current_user

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
    rescue
      Order.new
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    redirect_to login_path unless current_user
  end

end
