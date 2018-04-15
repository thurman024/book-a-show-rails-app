class Band < ApplicationRecord
  has_many :shows, class_name: :Booking

  validates :name, presence: true
  validates :rate, numericality: { only_integer: true}

  # def next_show
  #   current_time = Time.now
  #   shows = self.shows.order("showtime")
  #   shows.where("showtime > ?", current_time).limit(1)
  # end
end
