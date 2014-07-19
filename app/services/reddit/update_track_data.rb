class Reddit::UpdateTrackData < Reddit::Shared
  def initialize(user, track_id)
    @user = user
    @client = create_client(user)
    @track_id = track_id
    process
  end

  def process
    link = Reddit::SingleLink.new(@client, @track_id).retrieve
    track = Track.find_by_name(@track_id)
    track.update_attributes(score: link.score, last_score: track.score)
    track 
  end
end