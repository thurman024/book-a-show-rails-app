class Venue < ApplicationRecord
  has_many :bookings
  has_many :bands, through: :bookings

  validates :name, presence: true

  # def show_count
  #   @count = self.shows.count
  #   if @count == 0
  #     "No scheduled shows"
  #   else
  #     pluralize(@count, 'show') + " scheduled"
  #   end
  # end
  
end
