class FilterController < ApplicationController
  def show
    @user = current_user
    @filters = desk.filters
    @labels = desk.labels

    @cases = @desk.filter_cases(params['id'])

    render 'home/index'
  end
end
