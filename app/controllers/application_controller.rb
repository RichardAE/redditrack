class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :refresh_reddit_token

  def refresh_reddit_token
    RefreshRedditToken.run(current_user) if user_signed_in?
  end

  def only_respond_to_ajax
    respond_to do |format|
      format.html { redirect_to dashboard_path }
      format.js   {}
    end
  end
end
