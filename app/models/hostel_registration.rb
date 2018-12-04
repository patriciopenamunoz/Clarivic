class HostelRegistration < ApplicationRecord
  belongs_to :user
  belongs_to :hostel

  enum role: %i[tenant ex-tenant admin]
end
