class Reservation < ApplicationRecord
  belongs_to :hostel_registration
  has_many :reserved_rooms
end
