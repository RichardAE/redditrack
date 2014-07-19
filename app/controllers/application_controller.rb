class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :check_token

  # Check if the users API token needs to be refreshed
  def check_token
    if user_signed_in?
      RefreshRedditToken.new(current_user).refresh_token
    end
  end

  def only_respond_to_ajax
    respond_to do |format|
      format.html {  }
      format.js   {}
    end
  end
end
