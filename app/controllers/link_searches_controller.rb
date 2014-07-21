class LinkSearchesController < ApplicationController
  before_action :authenticate_user!, :only_respond_to_ajax

  def create
    @search = Reddit::LinksSearch.new(current_user, params[:search])
  end
end