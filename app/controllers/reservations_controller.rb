class ReservationsController < ApplicationController
  before_action :set_date, only: %i[set_dates set_dates_and_redirect set_dates_room_types]

  def set_dates
    respond_to do |format|
      format.js
    end
  end

  def set_dates_and_redirect
    redirect_to controller: 'hostels', action: 'index',
                            region_id: params[:region_id]
  end

  def set_dates_room_types
    @room_types = Hostel.find(params[:hostel_id]).room_types
  end

  private

  def set_date
    session[:starting_date] = params[:starting_date]
    session[:ending_date] = params[:ending_date]
  end

end
