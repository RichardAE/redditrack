class Reddit::LinksSearch < Reddit::Shared
  def initialize(user, search, id = nil)
    @client = create_client(user)
    @search = search
    @id = id
  end

  def links_by_term
    @results = @client.search(build_search_query, build_search_options)
  end

  def build_track
    Track.new
  end

  def track_names_array
    @user.tracks.map {|t| t.name }
  end

  private

  def build_search_query
    "title:#{@search[:term]}"
  end

  def build_search_options
    options = { limit: 25, sort: @search[:sort], time: @search[:time] }
    check_sub_search(options)
    check_is_update(options)
    options
  end

  def check_sub_search(options)
    if !@search[:subreddit].blank?
      options[:subreddit] = @search[:subreddit] 
      options[:restrict_to_subreddit] = true
    end
  end

  def check_is_update(options)
    if !@id.nil?
      options[:after] = @id
    end
  end
end