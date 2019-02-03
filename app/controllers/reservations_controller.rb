class ReservationsController < ApplicationController
  before_action :set_date, only: %i[set_dates set_dates_and_redirect set_dates_room_types]

  def index
    @reservations = HostelRegistration.where(user: current_user).map { |r| r.pending_reservations }.sum
  end

  def create
    @hostel_registration = HostelRegistration.find_by(hostel_id: params[:hostel_id], user: current_user)
    if @hostel_registration.nil?
      @hostel_registration = HostelRegistration.new
      @hostel_registration.user = current_user
      @hostel_registration.hostel_id = params[:hostel_id]
      @hostel_registration.save!
      @hostel_registration.user!
    end

    @reservation = @hostel_registration.reservations.find_by(payed: false)
    if @reservation.nil?
      @reservation = Reservation.new
      @reservation.hostel_registration = @hostel_registration
      @reservation.starting_date = session[:starting_date]
      @reservation.ending_date = session[:ending_date]
      @reservation.payed = false
      @reservation.save!
    end

    @reserved_room = @reservation.reserved_rooms.find_by(room_type_id: params[:room_type_id])
    if @reserved_room.nil?
      @reserved_room = ReservedRoom.new
      @reserved_room.reservation = @reservation
      @reserved_room.room_type_id = params[:room_type_id]
      @reserved_room.quantity = 1
    else
      @reserved_room.quantity += 1
    end
    @reserved_room.save!

    redirect_to reservations_path
  end


#-------------------------------------------------------------------------------

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
