class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def reddit
    @user = UserFromOmniauth.new(request.env["omniauth.auth"]).create_or_fetch

    logger.info(request.env["omniauth.auth"].inspect)

    sign_in_and_redirect @user, :event => :authentication 
    set_flash_message(:notice, :success, :kind => "Reddit") if is_navigational_format?
  end
end