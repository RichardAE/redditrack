class Link::RetrievesController < ApplicationController
  def create 
    client = Reddit::Shared.new.create_client(current_user)
    @link = Reddit::LinkViaUrl.new(current_user, params[:path]).retrieve
    @track = current_user.tracks.new
  end
end
