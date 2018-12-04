class Hostel < ApplicationRecord
  belongs_to :commune

  has_many :hostel_registrations
  has_many :users, through: :hostel_registrations

  has_one :region, through: :commune
  has_one_attached :principal_image
end
