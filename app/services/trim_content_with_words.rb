class TrimContentWithWords < BaseService

  def execute(text, limit_to_trim)
    if text.length > limit_to_trim
      perform_trim(text, limit_to_trim)
    else
      text
    end
  end

  private

  def perform_trim(text, limit_to_trim)
    text.split(" ").each_with_object("") do |x,ob|
      break ob unless (ob.length + " ".length + x.length <= limit_to_trim);ob << (" " + x)
    end.strip + "..."
  end
end