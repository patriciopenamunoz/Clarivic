class ReservationsController < ApplicationController
  before_action :set_date, only: %i[set_dates set_dates_and_redirect]

  def set_dates
    respond_to do |format|
      format.js
    end
  end

  def set_dates_and_redirect
    redirect_to controller: 'hostels', action: 'index',
                            region_id: params[:region_id]
  end

  private

  def set_date
    session[:starting_date] = params[:starting_date]
    session[:ending_date] = params[:ending_date]
  end
end
