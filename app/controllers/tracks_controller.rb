class TracksController < ApplicationController
  before_filter :authenticate_user!

  def create
    @track = create_track

    only_respond_to_ajax
  end

  def update
    @track = Reddit::UpdateTrackData.new(current_user, params[:id]).process

    only_respond_to_ajax
  end

  def destroy
    @track = destroy_track

    only_respond_to_ajax
  end

  private

  def create_track
    current_user.tracks.create(track_params)
  end

  def destroy_track
    current_user.tracks.find(params[:id]).destroy
  end

  def track_params
    params.require(:track).permit(:title, :name, :score, :last_score, :target_score)
  end
end