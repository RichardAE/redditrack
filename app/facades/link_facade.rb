class LinkFacade < SharedFacade
  def initialize(user, sub)
    @user = user
    @sub = sub
  end

  def reddit_front_page
    @links ||= Reddit::LinksFrontPage.new(@user).retrieve
  end

  def reddit_by_sub
    @links ||= Reddit::LinksFromSub.new(@user, @sub).retrieve
  end
end