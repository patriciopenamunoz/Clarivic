class HostelRegistration < ApplicationRecord
  belongs_to :user
  belongs_to :hostel
  has_many :comments, dependent: :destroy
  has_many :reservations, dependent: :destroy

  enum role: %i[user admin]

  def pending_reservations
    reservations.where(payed: false)
  end

  def has_active_reservations?
    reservations.select { |r| r.payed? && r.in_date? }.count.positive?
  end

  def no_expired_reservations?
    reservations.select { |r| r.payed? && !r.expired? }.count.positive?
  end
end
