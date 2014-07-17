class Reddit::SubSearch < Reddit::Shared
  def initialize(user, search)
    @client = create_client(user)
    @search = search
  end

  def search_subs_by_name
    @results = @client.search_subreddits_by_name("#{@search}")
  end
end