class Reddit::Shared
  def create_client(user)
    RedditKit::Client.new user
  end

  def user_subs_list(user)
    Reddit::SubListFromUser.new(user).user_subscribed_subs
  end
end