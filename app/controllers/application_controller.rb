class ApplicationController < ActionController::Base
  before_action :require_login
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :desk

  private
  def current_user
    @current_user ||= (
      begin
        User.find(session[:user_id]) if session[:user_id]
      rescue ActiveRecord::RecordNotFound
        nil
      end
    )
  end

  def desk
    opts = {token: session[:oauth_token], token_secret: session[:oauth_secret]}
    @desk ||= DeskWrapper::Client.new(opts)
  end

  def require_login
    if current_user.nil?
      redirect_to login_url
    end
  end
end
