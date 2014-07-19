class Reddit::SubUnsubscribe  < Reddit::Shared
  def initialize(user, subreddit)
    @user = user
    @client = create_client(user)
    @subreddit = subreddit
    process
  end

  def process
    @unsubscribe = @client.unsubscribe("#{@subreddit}")
  end

  def user_subscribed_subs
    @subreddits = user_subs_list(@user)
  end
end