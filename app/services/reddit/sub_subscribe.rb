class Reddit::SubSubscribe < Reddit::Shared
  def initialize(user, subreddit)
    @user = user
    @client = create_client(user)
    @subreddit = subreddit
    process
  end

  def process
    @subscribe = @client.subscribe("#{@subreddit}")
  end

  def user_subscribed_subs
    @subreddits = user_subs_list(@user)
  end

  def subs_for_search
    @subs_for_search ||= Hash[ @subreddits.map{ |s| [s.name,s.name] } ]
  end
end