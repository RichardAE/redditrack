class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
    @dashboard = DashboardFacade.new(current_user)
    pass_data_to_js
  end

  def update
    current_user.update_attributes(user_params)
    only_respond_to_ajax
  end

  private

  def pass_data_to_js
    gon.user_id = current_user.id
    gon.user_tracks = @dashboard.track_names_array
  end

  def user_params
    params.require(:user).permit(:email, :notify_me)
  end
end 