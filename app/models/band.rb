class Band < ApplicationRecord
  has_many :shows, class_name: :Booking

  validates :name, presence: true
  validates :rate, numericality: { only_integer: true}

  # def show_count
  #   @count = self.shows.count
  #   if @count == 0
  #     "No scheduled shows"
  #   else
  #     pluralize(@count, 'show') + " scheduled"
  #   end
  # end
  #
  # def next_show
  #   if @count == 0
  #     "There are no scheduled shows for this band"
  #   else
  #     current_time = Time.now
  #     shows = self.shows.order("showtime")
  #     shows.where("showtime > ?", current_time).limit(1)
  #   end
  # end
end
