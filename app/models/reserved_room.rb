class ReservedRoom < ApplicationRecord
  belongs_to :reservation
  belongs_to :room_type
end
