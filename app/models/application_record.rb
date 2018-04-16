class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # def next_show
  #   current_time = Time.now
  #   shows = self.bookings.order("showtime") || self.shows.order("showtime")
  #   shows.where("showtime > ?", current_time).limit(1)
  # end
end
