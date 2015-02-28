class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def reddit
    @user = UserFromOmniauth.new(request.env["omniauth.auth"]).create_or_fetch

    sign_in_and_redirect @user, :event => :authentication 
    flash[:success] = "signin"
  end
end