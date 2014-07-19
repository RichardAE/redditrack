module ApplicationHelper
  def url_from_permalink(permalink)
    "http://www.reddit.com#{permalink}"
  end

  def vote_up_link(link)
    if !link.attributes[:likes].nil?
      "Voted"
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
      "class=hit_target"
    else
      "class=rising"
    end
  end

  private

  def generate_vote_btn(link)
    button_to "^^", vote_path(id: link.full_name), :method => :put, remote: true
  end
end
