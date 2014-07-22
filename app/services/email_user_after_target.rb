class EmailUserAfterTarget 
  def initialize(user, track)
    @user = user
    @track = track
  end
  
  def process
    TrackMailer.hit_target(@user, @track).deliver
  end
end