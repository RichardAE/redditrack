class BaseFacade
  def initialize(user)
    @user ||= user
  end

  def user_tracks
    @user_tracks ||= @user.tracks
  end

  def track_names_array
    @mapped_tracks ||= @user.tracks.map {|t| t.name }
  end

  def build_track
    @track ||= Track.new
  end
end