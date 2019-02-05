class DashboardController < ApplicationController
  before_action :authenticate_user!

  def reservations
    @my_reservations = current_user.reservations.where(payed: true)
    @my_reservations.select { |r| !r.expired? }
  end

  def hostels
    @my_hostels = current_user.hostel_registrations.where(role: 'admin')
    @my_hostels = @my_hostels.map { |h| h.hostel }
  end
end
