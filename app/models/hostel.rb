class Hostel < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :address_number, presence: true, numericality: { only_integer: true }
  validates :principal_image, presence: true

  belongs_to :commune

  has_many :hostel_registrations, dependent: :destroy
  has_many :users, through: :hostel_registrations
  has_many :comments, through: :hostel_registrations
  has_many :hostel_features, dependent: :destroy
  has_many :room_types, dependent: :destroy

  has_one :region, through: :commune
  has_one_attached :principal_image

  def region_id
    if defined? region.id
      region.id
    else
      nil
    end
  end

  def full_address
    "Chile, #{region.full_name}, #{commune.full_name}, #{address} #{address_number}"
  end

  def value_per_night_from
    room_types.map { |e| e.value_per_night }.min.to_i
  end

  def rooms_left_in_range(starting_date: Date.current, ending_date: Date.current + 1)
    room_types.map { |r| r.rooms_left_in_range(starting_date:starting_date, ending_date:ending_date) }.sum
  end

end
