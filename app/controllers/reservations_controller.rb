class ReservationsController < ApplicationController
  def set_dates_and_redirect
    session[:starting_date] = params[:starting_date]
    session[:ending_date] = params[:ending_date]
    redirect_to controller: 'hostels', action: 'index',
                            region_id: params[:region_id]
  end
end
