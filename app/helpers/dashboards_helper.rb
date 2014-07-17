module DashboardsHelper
  def trim_content(text, limit)
    if !text.blank?
      TrimContentWithWords.trimmed_content(text, limit)
    end
  end
end