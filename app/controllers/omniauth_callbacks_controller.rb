class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  # Process OAuth login via Reddit
  def reddit
    @user = UserFromOmniauth.new(request.env["omniauth.auth"]).create_or_fetch

    sign_in_and_redirect @user, :event => :authentication 
    flash[:notice] = "You have successfully logged in via Reddit. If you want email notificiations for your tracks, click on the 'Settings' link above to configure this."
  end
end