module ApplicationHelper
  def url_from_permalink(permalink)
    "http://www.reddit.com#{permalink}"
  end

  def vote_up_link(link)
    if !link.attributes[:likes].nil?
      "<i class=\"icon-thumbs-up\"></i>".html_safe
    else
      generate_vote_btn(link)
    end
  end

  def check_link_tracking?(user_tracks, link)
    user_tracks.include?(link.full_name)
  end

  def div_id(name, id)
    "#{name}_#{id}"
  end

  def check_hit_target(track)
    if track.score >= track.target_score
      "hit_target"
    else
      check_rise_or_fall(track)
    end
  end

  def get_search_header(sub,term)
    if sub.blank?
      ("Links from all subs" + get_search_term(term)).html_safe
    else
      ("Links from #{sub}"  + get_search_term(term)).html_safe
    end
  end

  def trim_content(text, limit)
    if !text.blank?
      TrimContentWithWords.trimmed_content(text, limit)
    end
  end

  private

  def get_search_term(term)
    if !term.blank?
      " for '<b>#{term}</b>'"
    else
      ""
    end
  end

  def check_rise_or_fall(track)
    if track.score >= track.first_score
      "rising"
    else
      "falling"
    end
  end

  def generate_vote_btn(link)
    link_to vote_path(id: link.full_name), method: :put, title: "Upvote", remote: true do 
      "<i onclick=\"quick_hide(this);\" class=\"icon-arrow-up\"></i>".html_safe
    end
  end
end
