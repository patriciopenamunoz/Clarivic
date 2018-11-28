class Hostel < ApplicationRecord
  belongs_to :user
  has_one_attached :principal_image
end
