class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    @dashboard = Dashboard.new(current_user)
    pass_data_to_js
  end

  private

  def pass_data_to_js
    gon.subs_path = subs_path
    gon.links_path = link_retrieve_path
    gon.user_id = current_user.id
    gon.user_tracks = @dashboard.track_names_array
  end
end