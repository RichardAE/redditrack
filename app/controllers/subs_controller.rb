class SubsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @add_sub = Reddit::SubAdd.new(current_user, params[:subreddit])

    only_respond_to_ajax
  end

  def destroy
    @remove_sub = Reddit::SubRemove.new(current_user, params[:subreddit])

    only_respond_to_ajax
  end
end