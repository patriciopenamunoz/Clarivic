class RoomType < ApplicationRecord
  belongs_to :hostel
  has_many :reserved_rooms

  has_one_attached :image

  def occupied_rooms(date: Date.current)
    reserved_rooms.map { |r| r.reservation.in_date?(date: date) ? r.quantity : 0 }.sum
  end

  def occupied_rooms_in_range(starting_date: Date.current, ending_date: Date.current + 1)
    date_counter = starting_date
    rooms_stack = []
    while date_counter <= ending_date
      rooms_stack += [occupied_rooms(date: date_counter)]
      date_counter += 1
    end
    rooms_stack.max
  end

  def rooms_left(date: Date.current)
    number_rooms - occupied_rooms(date:date)
  end
end
