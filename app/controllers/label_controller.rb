class LabelController < ApplicationController
  def create
    wanted_keys = %w(name description types color)
    opts = params.select{|k,v| wanted_keys.include?(k)}

    desk.new_label(opts)

    @user = current_user
    @filters = desk.filters
    @labels = desk.labels
    @cases = @desk.cases
  end
end
