class Reddit::UpdateTrackData < Reddit::Shared
  def initialize(user, track_id)
    @client = create_client(user)
    @track_id = track_id
  end

  def process
    link = Reddit::FetchPost.run(@client, @track_id)
    track = @user.tracks.find_by_name(@track_id)
    track.update_attributes(score: link.score.to_i, hit_target: check_has_hit_target(link, track))
    track.increment!(:total_pings)
    email_notify(track)
    track
  end

  private

  def check_has_hit_target(link, track)
    if link.score.to_i >= track.target_score && track.hit_target == 0
      1
    else
      check_has_been_notified(link, track)
    end
  end

  def check_has_been_notified(link, track)
    if link.score.to_i >= track.target_score && track.hit_target == 1
      2
    else
      2
    end
  end

  def email_notify(track)
    if track.hit_target == 1 && @user.notify_me && @user.email !~ /user\d+@reddittrack.com/
      TrackMailer.hit_target(@user, track).deliver
    end
  end
end