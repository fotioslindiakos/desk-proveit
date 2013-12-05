Desk::Application.routes.draw do
  root 'home#index'

  get "/auth/:provider/callback" => "sessions#create"
  get "/logout" => "sessions#destroy", :as => :logout
  get "/login"  => "sessions#login", :as => :login
end
