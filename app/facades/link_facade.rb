class LinkFacade < SharedFacade
  def initialize(user)
    super
  end

  def reddit_front_page
    @links ||= Reddit::LinksFrontPage.new(@user).retrieve
  end

  def reddit_by_sub
    @links ||= Reddit::LinksFrontPage.new(@user).retrieve
  end
end