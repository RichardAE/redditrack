class Reddit::LinksFromSub < Reddit::Shared
  def initialize(user, sub)
    @client = create_client(user)
    @sub = sub
  end

  def retrieve
    @links = @client.links(@sub, {category: "hot", limit: 25})
  end
end