class VotesController < ApplicationController
  before_filter :authenticate_user!, :only_respond_to_ajax

  def update
    @link = Reddit::VoteUpLink.new(current_user, params[:id]).process
  end

end