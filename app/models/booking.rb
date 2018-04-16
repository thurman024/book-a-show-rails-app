class Booking < ApplicationRecord
  belongs_to :band
  belongs_to :venue

  def self.next_show
    order("showtime").where("showtime > ?", Time.current).limit(1)
  end
end
