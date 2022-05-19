class Room < ApplicationRecord
  has_one_attached :photo
  belongs_to :location
  has_many :bookings
end
