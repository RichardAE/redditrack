class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    @dashboard = Dashboard.new(current_user)
    pass_data_to_js
  end

  private

  def track_names_array
    current_user.tracks.map {|u| u.name }
  end

  def pass_data_to_js
    gon.user_id = current_user.id
    gon.user_tracks = track_names_array
  end


end