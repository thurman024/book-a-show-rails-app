class Band < ApplicationRecord
  has_many :shows, class_name: :Booking

  validates :name, presence: true
  validates :rate, numericality: { only_integer: true}
end
