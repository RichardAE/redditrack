class UsersController < ApplicationController
  before_filter :authenticate_user!

  def edit
    @dashboard = Dashboard.new(current_user)
    pass_data_to_js
  end

  def update
    update_user
    only_respond_to_ajax
  end

  private

  def update_user
    current_user.update_attributes(user_params)
  end

  def pass_data_to_js
    gon.user_id = current_user.id
    gon.user_tracks = @dashboard.track_names_array
  end

  def user_params
    params.require(:user).permit(:email, :notify_me)
  end
end 