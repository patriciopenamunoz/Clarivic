class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :hostel_registrations
  has_many :hostels, through: :hostel_registrations
  has_many :reservations, through: :hostel_registrations

  def full_name
    "#{first_name} #{middle_name} #{first_surname} #{second_surname}"
  end

  enum gender: %i[male female other]
  enum access_level: %i[user admin]
end
