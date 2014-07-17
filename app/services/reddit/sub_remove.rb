class Reddit::SubRemove  < Reddit::Shared
  def initialize(user, subreddit)
    @user = user
    @client = create_client(user)
    @subreddit = subreddit
    unsubscribe_from_sub
  end

  def unsubscribe_from_sub
    @unsubscribe = @client.unsubscribe("#{@subreddit}")
  end

  def user_subscribed_subs
    @subreddits = user_subs_list(@user)
  end
end