class Dashboard
  require 'redditkit'

  def initialize(user)
    @user = user
  end

  def subscribed_subs
    @subreddits = Reddit::SubListFromUser.new(@user).user_subscribed_subs
  end

  def reddit_front_page
    @links = Reddit::LinksFrontPage.new(@user).front_page
  end
end