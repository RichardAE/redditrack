class GetUserFromOmniauth < BaseService

  def execute(auth_data)
    @auth_data = auth_data

    user = fetch_existing_user || create_new_user
    update_token(user)
    user
  end

  private

  def fetch_existing_user
    User.find_by(provider: split_auth_data.provider, uid: split_auth_data.uid)
  end

  def create_new_user
    User.create(
        provider: @auth_data.provider,
        uid:      @auth_data.uid,
        name:     @auth_data.info.name,
        email:    "user#{get_new_user_id}@reddittrack.com",
        password: Devise.friendly_token[0,20]
    )
  end

  def update_token(user)
    user.update_attributes(
        token:           @auth_data.credentials.token,
        refresh_token:   @auth_data.credentials.refresh_token,
        token_signed_at: Time.now
    )
  end

  def split_auth_data
    @auth_data_pieces ||= @auth_data.slice(:provider, :uid)
  end

  def get_new_user_id
    if(user = User.last)
      user.id + 1
    else
      1
    end
  end
end