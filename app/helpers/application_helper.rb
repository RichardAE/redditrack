module ApplicationHelper

  def div_id(name, id)
    "id=#{name}_#{id}"
  end

  def div_id_s(name, id)
    "#{name}_#{id}"
  end

  def url_from_permalink(permalink)
    "http://www.reddit.com#{permalink}"
  end

  def vote_up_link(link)
    if link.attributes[:likes].nil?
      generate_vote_btn(link)
    else
      '<i class=icon-thumbs-up></i>'.html_safe
    end
  end

  def check_link_tracking(user_tracks, link)
    unless user_tracks.include?(link.full_name)
      'class=hide'
    end
  end

  def check_link_tracked(user_tracks, link)
   if user_tracks.include?(link.full_name)
      'class=hide'
    end
  end

  def check_hit_target(track)
    if track.score >= track.target_score
      'hit_target'
    else
      check_rise_or_fall(track)
    end
  end

  def get_search_header(sub,term)
    if sub.blank?
      "Links from all subs #{get_search_term(trim_content(term, 50))}".html_safe
    else
      "Links from /r/#{sub}#{get_search_term(trim_content(term, 50))}".html_safe
    end
  end

  def trim_content(text, limit)
    unless text.blank?
      TrimContentWithWords.trimmed_content(text, limit)
    end
  end

  def bootstrap_class_for flash_type
    if flash_type == 'alert'
      'alert-danger'
    else
      'alert-success'
    end
  end

  private

  def get_search_term(term)
    if term.blank?
      ''
    else
      " for '<b>#{term}</b>'"
    end
  end

  def check_rise_or_fall(track)
    if track.score >= track.first_score
      'rising'
    else
      'falling'
    end
  end

  def generate_vote_btn(link)
    link_to vote_path(id: link.full_name), method: :put, title: "Up-vote", remote: true do
      '<i class=quick_hide icon-arrow-up></i>'.html_safe
    end
  end
end
