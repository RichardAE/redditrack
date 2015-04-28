class Link::RetrievalsController < ApplicationController
  before_action :authenticate_user!, :only_respond_to_ajax
  
  def show
    @links = LinkFacade.new(current_user, get_sub)
  end

  def create 
    @link = Reddit::FetchPostViaUrl.run(current_user, params[:path])
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
