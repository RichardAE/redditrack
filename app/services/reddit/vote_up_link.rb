class Reddit::VoteUpLink < Reddit::Shared
  def initialize(user, link_id)
    @link_id = link_id
    @client = create_client(user)
  end

  def process
    link = Reddit::FetchPost.new(@client, @link_id).retrieve
    @client.upvote(link) 
    link
  end
end