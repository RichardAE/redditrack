module Reddit
  class FetchPostViaUrl < BaseService

    def execute(user, path)
      client = RedditKit::Client.new(user)

      if valid_reddit_link?(path)
        Reddit::FetchPost.run(client, get_link_id(path))
      else
        false
      end
    end

    private

    def valid_reddit_link?(path)
      path =~ /http:\/\/www\.reddit\.com\/r\/([a-zA-Z0-9])+\/comments\/+(\/)?/
    end

    def get_link_id(path)
      link_id = path.match(/\/comments\/[a-z0-9]{1,10}?\//)[0].split('/')[2]

      "t3_#{link_id}"
    end
  end
end