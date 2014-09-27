class Link::RetrievalsController < ApplicationController
  def show
    @dashboard = Dashboard.new(current_user)
  end

  def create 
    @link = Reddit::LinkViaUrl.new(current_user, params[:path]).retrieve
    @track = current_user.tracks.new
  end
end
