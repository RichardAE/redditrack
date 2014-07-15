class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def reddit
    @user = UserFromOmniauth.new(request.env["omniauth.auth"]).create_or_fetch

    sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
    set_flash_message(:notice, :success, :kind => "Reddit") if is_navigational_format?
    
  end
end