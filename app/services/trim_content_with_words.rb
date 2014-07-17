class TrimContentWithWords
  def self.trimmed_content(text, limit_to_trim)
    if text.length > limit_to_trim
      self.perform_trim(text, limit_to_trim)
    else
      text
    end
  end

  private

  def self.perform_trim(text, limit_to_trim)
    text.split(" ").each_with_object("") {|x,ob| break ob unless (ob.length + " ".length + x.length <= limit_to_trim);ob << (" " + x)}.strip + "..."
  end
end