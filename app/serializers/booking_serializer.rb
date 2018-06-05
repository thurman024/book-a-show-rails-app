class BookingSerializer < ActiveModel::Serializer
  attributes :id, :showtime

  belongs_to :band
  belongs_to :venue
end
