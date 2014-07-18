class SubSearchesController < ApplicationController
  before_action :authenticate_user!

  def create
    @search = Reddit::SubSearch.new(current_user, params[:search])

    only_respond_to_ajax
  end
end