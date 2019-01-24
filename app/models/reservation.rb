class Reservation < ApplicationRecord
  belongs_to :hostel_registration
  has_many :reserved_rooms

  def started?(date: Date.current)
    date >= starting_date
  end

  def expired?(date: Date.current)
    date > ending_date
  end

  def in_date?(date: Date.current)
    started?(date: date) && !expired?(date: date)
  end
end
