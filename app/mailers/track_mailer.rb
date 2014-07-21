class TrackMailer < ActionMailer::Base
  default from: "noreply@redditrack.com"

  def hit_target(user, track)
    @user = user
    @track = track
    mail(:to => "<#{user.email}>", :subject => "Your Reddit Track has hit it's target!")
  end
end
