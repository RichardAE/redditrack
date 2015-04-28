module Reddit
  class FetchPost < BaseService
    def execute(client, link_name)
      client.link(link_name)
    end
  end
end