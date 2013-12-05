class ApplicationController < ActionController::Base
  before_action :require_login
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :desk

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def desk
    @desk ||= Desk.client({oauth_token: session[:oauth_token], oauth_token_secret: session[:oauth_secret]})
  end

  def require_login
    unless current_user
      redirect_to login_url
    end
  end
end
