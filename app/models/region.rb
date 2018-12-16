class Region < ApplicationRecord
  has_many :communes
  has_many :hostels, through: :communes
end
