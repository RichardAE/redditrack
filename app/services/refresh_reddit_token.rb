class RefreshRedditToken
  def initialize(user)
    @user = user
  end

  def refresh_token
    if user_needs_token_refresh?
      response = make_refresh_request
      parsed_response = JSON.parse(response.body)

      save_refresh_token(parsed_response)
    end
  end

  private

  def user_needs_token_refresh?
    now = Time.now.to_datetime.to_i
    signed = @user.token_signed_at.to_datetime.to_i

    (now - signed) >= 3600
  end

  def make_refresh_request
    HTTParty.post("https://ssl.reddit.com/api/v1/access_token",
      body: { 
        state: "refresh_token_#{rand(0..20000)}",
        redirect_uri: ENV['REDDIT_URI'], 
        refresh_token: @user.refresh_token,
        grant_type: 'refresh_token',
      },
      basic_auth: { 
        username: ENV['REDDIT_KEY'], 
        password: ENV['REDDIT_SECRET']
      }
    )
  end

  def save_refresh_token(parsed_response)
    @user.token = parsed_response["access_token"]
    @user.token_signed_at = Time.now
    @user.save
  end
end