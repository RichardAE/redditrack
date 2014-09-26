class Link::RetrievesController < ApplicationController
  def create 
    @track = Reddit::AddLinkViaUrl.new(current_user, params[:path]).process
  end
end
