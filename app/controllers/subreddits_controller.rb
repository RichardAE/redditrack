class SubredditsController < ApplicationController
  before_action :authenticate_user!
  before_action :only_respond_to_ajax
  
  def index
    @subreddit = SubredditFacade.new(current_user)
  end

  def create
    @subreddit = Reddit::SubSubscribe.new(current_user, params[:subreddit])
  end

  def destroy
    @subreddit = Reddit::SubUnsubscribe.new(current_user, params[:id])
  end
end