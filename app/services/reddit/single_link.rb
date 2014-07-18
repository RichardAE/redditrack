class Reddit::SingleLink < Reddit::Shared
  def initialize(user, link_name)
    @user = user 
    @link_name = link_name
    @client = create_client(@user)
  end

  def retrieve
    link = @client.link(@link_name)
  end
end