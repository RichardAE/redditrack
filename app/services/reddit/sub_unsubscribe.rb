class Reddit::SubUnsubscribe  < Reddit::Shared
  def initialize(user, subreddit)
    @client = create_client(user)
    @subreddit = subreddit
    process
  end

  def process
    @unsubscribe = @client.unsubscribe("#{@subreddit}")
  end
end