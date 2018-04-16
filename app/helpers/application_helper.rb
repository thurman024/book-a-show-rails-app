module ApplicationHelper

  def format_showtime(t)
    t.strftime("%B %-d, %Y at %-I:%M%p")
  end

  def show_count_message(shows)
    count = shows.count
    if count == 0
      "No scheduled shows"
    else
      pluralize(count, 'show') + " scheduled"
    end
  end

end
