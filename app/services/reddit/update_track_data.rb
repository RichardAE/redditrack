class Reddit::UpdateTrackData < Reddit::Shared
  def initialize(user, track_id)
    @user = user
    @client = create_client(user)
    @track_id = track_id
  end

  def update_track_data
    link = Reddit::SingleLink.new(@user, @track_id).retrieve
    track = Track.find_by_name(@track_id)
    track.update_attributes(score: link.score)
    track 
  end
end