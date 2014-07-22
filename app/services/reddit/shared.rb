class Reddit::Shared
  def create_client(user)
    @user = user
    RedditKit::Client.new user
  end

  def user_subs_list(user)
    Reddit::SubListFromUser.new(user).retrieve
  end

  def user_subscribed_subs
    @subreddits = user_subs_list(@user)
  end

  def subs_for_search
    @subs_for_search ||= Hash[ @subreddits.map{ |s| [s.name,s.name] } ]
  end
end