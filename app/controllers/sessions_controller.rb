class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:create, :login]

  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    session[:oauth_token] = auth.credentials.token
    session[:oauth_secret] = auth.credentials.secret
    redirect_to root_url, :notice => "Signed in!"
  end

  def destroy
    [:user_id, :oauth_token, :oauth_secret].each do |sym|
      session[sym] = nil
    end
    redirect_to root_url, :notice => "Signed out!"
  end

  def login
    render layout: 'bare'
  end
end
