class Venue < ApplicationRecord
  has_many :bookings
  has_many :bands, through: :bookings

  validates :name, presence: true

  # def next_show
  #   current_time = Time.now
  #   shows = self.bookings.order("showtime")
  #   shows.where("showtime > ?", current_time).limit(1)
  # end
end
