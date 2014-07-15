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
      :provider => @auth.provider, 
      :uid => @auth.uid, 
      :name => @auth.info.name,
      :email => "reddit#{rand(0.500000).ceil}@reddittool.com", 
      :password => Devise.friendly_token[0,20]
    )
  end

  def update_token(user)
    user.update_attribute(:token, @auth.credentials.token)
  end
end