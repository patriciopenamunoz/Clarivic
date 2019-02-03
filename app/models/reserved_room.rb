class ReservedRoom < ApplicationRecord
  belongs_to :reservation
  belongs_to :room_type

  def total
    room_type.value_per_night * quantity
  end
end
