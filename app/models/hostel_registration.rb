class HostelRegistration < ApplicationRecord
  belongs_to :user
  belongs_to :hostel
  has_many :comments, dependent: :destroy
  has_many :reservations, dependent: :destroy

  enum role: %i[user admin]

  def pending_reservations
    reservations.where(payed: false)
  end
end
