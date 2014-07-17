class SubSearchesController < ApplicationController
  before_action :authenticate_user!

  def new
    @search = Reddit::SubSearch.new(current_user, params[:search])

    respond_to do |format|
      format.html { redirect_to dashboard_path }
      format.js   {}
    end
  end
end