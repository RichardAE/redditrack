class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    @dashboard = Dashboard.new(current_user)
    pass_data_to_js
  end

  private

  def pass_data_to_js
    gon.user_id = current_user.id
    gon.user_tracks = @dashboard.track_names_array
  end


end