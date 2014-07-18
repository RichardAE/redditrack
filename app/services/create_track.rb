class CreateTrack
  def initialize(user, content)
    @user = user
    @content = content
    create
  end

  def create
    @track = @user.tracks.new(@content)
  end
end