class Venue < ApplicationRecord
  has_many :bookings
  has_many :bands, through: :bookings

  validates :name, presence: true

  def show_count
    @count = self.shows.count
    if @count == 0
      "No scheduled shows"
    else
      pluralize(@count, 'show') + "scheduled"
    end
  end

   def next_show
     if @count == 0
       "There are no scheduled shows for this band"
     else
       current_time = Time.now
       shows = self.bookings.order("showtime")
       shows.where("showtime > ?", current_time).limit(1)
   end
end
