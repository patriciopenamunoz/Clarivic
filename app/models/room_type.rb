class RoomType < ApplicationRecord
  belongs_to :hostel
  has_many :reserved_rooms

  has_one_attached :image
end
