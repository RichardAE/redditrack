class LinkSearchesController < ApplicationController
  before_action :authenticate_user!

  def create
    @search = Reddit::LinksSearch.new(current_user, params[:search])

    only_respond_to_ajax
  end
end