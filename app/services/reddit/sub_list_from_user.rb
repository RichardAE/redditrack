class Reddit::SubListFromUser < Reddit::Shared
  def initialize(user)
    @client = create_client(user)
  end

  def user_subscribed_subs
    @subreddits = sort_subs_by_name(user_subs_from_reddit)
  end

  private

  def sort_subs_by_name(subreddits)
    subreddits.sort_by { |sr| sr[:name].downcase }
  end 

  def user_subs_from_reddit
    @client.subscribed_subreddits :limit => 100
  end

end