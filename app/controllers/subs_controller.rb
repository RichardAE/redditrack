class SubsController < ApplicationController
  
  def create
    @add_sub = Reddit::SubAdd.new(current_user, params[:subreddit])

    respond_to do |format|
      format.html { redirect_to dashboard_path }
      format.js   {}
    end
  end

  def destroy
    @remove_sub = Reddit::SubRemove.new(current_user, params[:subreddit])

    respond_to do |format|
      format.html { redirect_to dashboard_path }
      format.js   {}
    end
  end
end