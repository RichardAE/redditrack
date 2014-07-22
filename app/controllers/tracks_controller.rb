class TracksController < ApplicationController
  before_filter :authenticate_user!, :only_respond_to_ajax

  def create
    @track = create_track
  end

  def update
    @track = Reddit::UpdateTrackData.new(current_user, params[:id]).process
  end

  def destroy
    @track = destroy_track
  end

  private

  def create_track
    current_user.tracks.create(track_params)
  end

  def destroy_track
    current_user.tracks.find(params[:id]).destroy
  end

  def track_params
    params.require(:track).permit(:title, :name, :score, :first_score, :target_score, :permalink)
  end
end