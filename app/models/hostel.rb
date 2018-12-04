class Hostel < ApplicationRecord
  belongs_to :user
  belongs_to :commune
  has_one :region, through: :commune
  has_one_attached :principal_image
end
