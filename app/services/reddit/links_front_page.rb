class Reddit::LinksFrontPage < Reddit::Shared
  def initialize(user)
    @client = create_client(user)
  end

  def retrieve
    @links = @client.front_page
  end
end