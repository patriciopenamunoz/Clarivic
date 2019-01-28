class RoomType < ApplicationRecord
  belongs_to :hostel
  has_many :reserved_rooms

  has_one_attached :image

  def occupied_rooms(date: Date.current)
    reserved_rooms.map { |r| r.reservation.in_date?(date: date) ? r.quantity : 0 }.sum
  end
end
