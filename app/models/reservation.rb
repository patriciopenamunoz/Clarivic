class Reservation < ApplicationRecord
  belongs_to :hostel_registration
  has_one :user, through: :hostel_registration
  has_one :hostel, through: :hostel_registration
  has_many :reserved_rooms, dependent: :destroy

  def actual_total
    total_counter = 0
    reserved_rooms.each { |r| total_counter += r.total }
    total_counter
  end

  def f_starting_date
    starting_date.strftime('%d/%m/%Y')
  end

  def f_ending_date
    ending_date.strftime('%d/%m/%Y')
  end

  def days
    (ending_date - starting_date).to_i
  end

  def days_left
    (ending_date - Date.current).to_i
  end

  def days_remaining
    (starting_date - Date.current).to_i
  end

  def date_hash
    {starting_date: starting_date, ending_date: ending_date}
  end

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
