class Venue < ApplicationRecord
  has_many :bookings
  has_many :bands, through: :bookings
  belongs_to :user

  validates :name, presence: true

end
