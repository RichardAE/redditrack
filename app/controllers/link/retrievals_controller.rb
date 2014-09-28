class Link::RetrievalsController < ApplicationController
  before_action :authenticate_user!, :only_respond_to_ajax
  
  def show
    @links = LinkFacade.new(current_user, get_sub)
  end

  def create 
    @link = Reddit::LinkViaUrl.new(current_user, params[:path]).retrieve
    @track = current_user.tracks.new
  end
  
  private

  def get_sub
    if params.has_key?(:subreddit)
      params[:subreddit]
    else
      nil
    end
  end
end
