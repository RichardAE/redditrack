class Reddit::SubAdd < Reddit::Shared
  def initialize(user, subreddit)
    @user = user
    @client = create_client(user)
    @subreddit = subreddit
    subscribe_to_sub
  end

  def subscribe_to_sub
    @subscribe = @client.subscribe("#{@subreddit}")
  end

  def user_subscribed_subs
    @subreddits = user_subs_list(@user)
  end
end