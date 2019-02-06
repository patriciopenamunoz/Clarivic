class HostelFeature < ApplicationRecord
  validates :title, presence: true
  belongs_to :hostel

  has_one_attached :image
end
