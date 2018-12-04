class HostelRegistration < ApplicationRecord
  belongs_to :user
  belongs_to :hostel
end
