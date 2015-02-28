class SubredditFacade < BaseFacade
  def initialize(user)
    super
  end

  def subscribed_subs
    @subreddits ||= Reddit::SubListFromUser.new(@user).retrieve
  end

  def subs_for_search
    @subs_for_search ||= Hash[ @subreddits.map{ |s| [s.name, s.name] } ]
  end
end