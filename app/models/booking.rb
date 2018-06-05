class Booking < ApplicationRecord
  belongs_to :band
  belongs_to :venue

  def self.next_show
    order("showtime").where("showtime > ?", Time.current).limit(1)
  end

  def self.sort_by_showtime
    order("showtime")
  end

  def next_button
    band = self.band
    show = Booking.order("showtime").where("showtime > ? AND band_id = ?", self.showtime, band.id).first
    if show
      show
    else
      Booking.order("showtime").where("band_id = ?", band.id).first
    end
  end

end
