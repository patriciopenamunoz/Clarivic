class Comment < ApplicationRecord
  validates :message, presence: true

  belongs_to :hostel_registration
  has_one :hostel, through: :hostel_registration
  has_one :user, through: :hostel_registration
end
