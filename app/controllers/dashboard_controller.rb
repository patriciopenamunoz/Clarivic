class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @my_hostels = current_user.hostel_registrations.where(role: 'admin')
    @my_hostels = @my_hostels.map { |h| h.hostel }
  end
end
