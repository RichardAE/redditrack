class Link::RetrievesController < ApplicationController
  def create 
    client = Reddit::Shared.new.create_client(current_user)
    @link = Reddit::SingleLink.new(client, "t3_2hliy2").retrieve
    @track = current_user.tracks.new
  end
end
