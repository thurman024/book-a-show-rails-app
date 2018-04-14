class Venue < ApplicationRecord
  has_many :bookings
  has_many :bands, through: :bookings
end
