class UserFromOmniauth
  def initialize(auth)
    @auth = auth
  end

  def create_or_fetch
    user = fetch_existing_user || create_new_user
    update_token(user)
    user
  end

  private

  def fetch_existing_user
    User.where(@auth.slice(:provider, :uid)).first
  end

  def create_new_user
    User.create(
      provider: @auth.provider, 
      uid: @auth.uid, 
      name: @auth.info.name,
      email: "user#{rand(0..50000).ceil}@reddittrack.com", 
      password: Devise.friendly_token[0,20]
    )
  end

  def update_token(user)
    user.update_attributes(token: @auth.credentials.token, refresh_token: @auth.credentials.refresh_token, token_signed_at: Time.now)
  end
end