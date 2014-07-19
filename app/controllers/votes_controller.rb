class VotesController < ApplicationController
  before_filter :authenticate_user!

  def update
    @link = Reddit::VoteUpLink.new(current_user, params[:id]).process

    only_respond_to_ajax
  end

end