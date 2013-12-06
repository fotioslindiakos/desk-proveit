class HomeController < ApplicationController
  def index
    @user = current_user
    @cases = desk.cases
    @filters = desk.filters
    @labels = desk.labels
  end
end
