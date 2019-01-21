class HostelRegistration < ApplicationRecord
  belongs_to :user
  belongs_to :hostel
  has_many :reservations

  enum role: %i[tenant ex-tenant admin]
end
