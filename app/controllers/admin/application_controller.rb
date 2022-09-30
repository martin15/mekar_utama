class Admin::ApplicationController < ApplicationController
  protect_from_forgery
  before_filter :require_login
  layout 'admin'
  helper_method :current_user

  def require_login
    if current_user.nil?
      flash[:error] = "You are not permitted, please login first"
      redirect_to login_path
    else
      return current_user
    end
  end

  private
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

end
