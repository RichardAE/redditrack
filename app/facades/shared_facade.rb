class SharedFacade
  def initialize(user)
    @user ||= user
  end

  def user_tracks
    @tracks ||= @user.tracks
  end

  def track_names_array
    @maptrack ||= @user.tracks.map {|t| t.name }
  end

  def build_track
    @track ||= Track.new
  end
end