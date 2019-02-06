class DashboardController < ApplicationController
  before_action :authenticate_user!

  def reservations
    @my_reservations = current_user.reservations.where(payed: true)
    @in_date = @my_reservations.select(&:in_date?)
    @future = @my_reservations.reject(&:started?)
    @history = @my_reservations.select(&:expired?)
  end

  def hostels
    @my_hostels = current_user.hostel_registrations.where(role: 'admin')
    @my_hostels = @my_hostels.map { |h| h.hostel }
  end

  def tenants
    @hostel = Hostel.find(params[:id])
    @hostel_registrations = @hostel.hostel_registrations.where(role: 'user')
    @tenants = @hostel_registrations.select(&:no_expired_reservations?).map { |r| r.user }
  end
end
