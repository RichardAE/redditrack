class Reddit::SubSubscribe < Reddit::Shared
  def initialize(user, subreddit)
    @client = create_client(user)
    @subreddit = subreddit
    process
  end

  def process
    @subscribe = @client.subscribe("#{@subreddit}")
  end
end