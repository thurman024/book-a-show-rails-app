module ApplicationHelper

  def format_showtime
    strftime("%B %-d, %Y at %-I:%M%p")
  end

  def show_count_message(shows)
    count = shows.count
    if count == 0
      "No scheduled shows"
    else
      pluralize(count, 'show') + " scheduled"
    end
  end

  # def next_show(all_shows)
  #   if all_shows.count == 0
  #     "There are no scheduled shows for this band"
  #   else
  #     current_time = Time.now
  #     shows = all_shows.order("showtime")
  #     shows.where("showtime > ?", current_time).limit(1)
  #   end
  # end

end
