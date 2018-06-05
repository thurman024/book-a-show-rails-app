require 'pry'
class Booking < ApplicationRecord
  belongs_to :band
  belongs_to :venue

  def self.next_show
    order("showtime").where("showtime > ?", Time.current).limit(1)
  end

  def self.next_button
    binding.pry
    show = Booking.order("showtime").where("id > ?", id).first
    if show
      show
    else
      Booking.order("showtime").first
    end
  end

end
