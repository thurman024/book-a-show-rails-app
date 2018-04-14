class Band < ApplicationRecord
  has_many :shows, class_name: :Booking

end
