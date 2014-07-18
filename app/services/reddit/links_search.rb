class Reddit::LinksSearch < Reddit::Shared
  def initialize(user, search)
    @client = create_client(user)
    @search = search
  end

  def links_by_term
    @results = @client.search(build_search_query, build_search_options)
  end

  def build_track
    Track.new
  end

  private

  def build_search_query
    "title:#{@search[:term]}"
  end

  def build_search_options
    options = { limit: 10, sort: @search[:sort], time: @search[:time] }
    check_sub_search(options)
    options
  end

  def check_sub_search(options)
    if !@search[:subreddit].blank?
      options[:subreddit] = @search[:subreddit] 
      options[:restrict_to_subreddit] = true
    end
  end
end