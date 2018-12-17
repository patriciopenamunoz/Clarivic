class HostelFeature < ApplicationRecord
  belongs_to :hostel

  has_one_attached :image
end
