class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  # Process OAuth login via Reddit
  def reddit
    @user = UserFromOmniauth.new(request.env["omniauth.auth"]).create_or_fetch

    sign_in_and_redirect @user, :event => :authentication 
    flash[:success] = "signin"
  end
end