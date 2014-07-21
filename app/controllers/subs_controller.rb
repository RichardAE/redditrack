class SubsController < ApplicationController
  before_action :authenticate_user!, :only_respond_to_ajax
  
  def create
    @add_sub = Reddit::SubSubscribe.new(current_user, params[:subreddit])
  end

  def destroy
    @remove_sub = Reddit::SubUnsubscribe.new(current_user, params[:id])
  end
end