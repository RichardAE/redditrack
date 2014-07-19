class Reddit::SingleLink < Reddit::Shared
  def initialize(client, link_name)
    @link_name = link_name
    @client = client
  end

  def retrieve
    link = @client.link(@link_name)
  end
end