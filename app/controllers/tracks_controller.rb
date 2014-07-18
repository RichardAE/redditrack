class TracksController < ApplicationController
  before_filter :authenticate_user!

  def create
    @track = create_track

    only_respond_to_ajax
  end

  def update
    @track = Reddit::UpdateTrackData.new(current_user, params[:id]).update_track_data

    only_respond_to_ajax
  end

  private

  def create_track
    current_user.tracks.create(track_params)
  end

  def track_params
    params.require(:track).permit(:title, :name, :score)
  end
end