class Reddit::AddLinkViaUrl < Reddit::Shared
  def initialize(user, link)
    @client = create_client(user)
    @user = user
    @link = link
  end

  def process
    link = Reddit::SingleLink.new(@client, "t3_2hhg4m").retrieve
    @user.tracks.create(
      title: link.title[0..244],
      name: link.attributes[:name],
      score: link.score,
      first_score: link.score,
      permalink: link.attributes[:permalink]
    )
    @user.tracks.count
  end

end