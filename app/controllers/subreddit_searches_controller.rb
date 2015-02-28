class SubredditSearchesController < ApplicationController
  before_action :authenticate_user!
  before_action :only_respond_to_ajax

  def create
    @search = Reddit::SubSearch.new(current_user, params[:search])
  end
end