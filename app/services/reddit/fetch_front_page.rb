module Reddit
  class FetchFrontPage < BaseService

    def execute(user)
      links = RedditKit::Client.new(user).front_page
      links
    end

  end
end