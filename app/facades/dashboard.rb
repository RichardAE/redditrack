class Dashboard
  require 'redditkit'

  def initialize(user)
    @user = user
  end

  def subscribed_subs
    @subreddits = Reddit::SubListFromUser.new(@user).user_subscribed_subs
  end

  def subs_for_search
    Hash[ @subreddits.map{ |s| [s.name,s.name] } ]
  end

  def reddit_front_page
    @links = Reddit::LinksFrontPage.new(@user).front_page
  end

  def user_tracks
    @tracks = @user.tracks
  end

  def build_track
    Track.new
  end
end