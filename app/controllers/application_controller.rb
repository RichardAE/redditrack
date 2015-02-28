class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :check_token

  def check_token
    if user_signed_in?
      RefreshRedditToken.new(current_user).refresh_token
    end
  end

  def only_respond_to_ajax
    respond_to do |format|
      format.html { redirect_to dashboard_path }
      format.js   {}
    end
  end
end
