class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def reddit
    @user = GetUserFromOmniauth.run(request.env["omniauth.auth"])

    sign_in_and_redirect @user, :event => :authentication 
    flash[:success] = "signin"
  end
end