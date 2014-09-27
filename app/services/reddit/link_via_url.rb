class Reddit::LinkViaUrl < Reddit::Shared
  def initialize(user, path)
    @client = create_client(user)
    @path = path
  end

  def retrieve
    if valid_reddit_link?
      Reddit::SingleLink.new(@client, get_unique_link_id).retrieve
    else
      false
    end
  end

  private

  def valid_reddit_link?
    @path =~ /http:\/\/www\.reddit\.com\/r\/([a-z0-9])+\/comments\/([a-z0-9])+\/([a-z0-9_])+(\/)?/
  end

  def get_unique_link_id
    't3_' + @path.match(/\/comments\/[a-z0-9]{1,10}?\//)[0].split('/')[2]
  end
end