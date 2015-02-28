class Link::SearchesController < ApplicationController
  before_action :authenticate_user!, :only_respond_to_ajax

  def create
    @search = Reddit::LinksSearch.new(current_user, params[:search])
  end

  def update
    @search_update = Reddit::LinksSearch.new(current_user, params[:update], params[:id])
  end
end