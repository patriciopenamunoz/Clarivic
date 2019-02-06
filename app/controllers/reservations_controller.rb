class ReservationsController < ApplicationController
  before_action :set_date, only: %i[set_dates set_dates_and_redirect set_dates_room_types]

  def index
    @reservations = HostelRegistration.where(user: current_user).map { |r| r.pending_reservations }.sum
  end

  def show
    @reservation = Reservation.find(params[:id])
    @admin = @reservation.hostel.hostel_registrations.find_by(role: :admin).user
    @type = 'in_date' if @reservation.in_date?
    @type = 'future' if !@reservation.started?
    @type = 'history' if @reservation.expired?
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
      unless @reserved_room.room_type.rooms_left_in_range(@reserved_room.reservation.date_hash).zero?
        @reserved_room.quantity += 1
      end
    end
    @reserved_room.save!

    redirect_to reservations_path
  end

#-------------------------------------------------------------------------------
  def pre_pay
    @reservation = Reservation.find(params[:id])
    items = @reservation.reserved_rooms.map do |reserved_room|
      {
        name: "Arriendo habitación #{reserved_room.room_type.name}",
        sku: reserved_room.room_type.id.to_s,
        price: ((reserved_room.room_type.value_per_night) / 700).round(2).to_s,
        currency: 'USD',
        quantity: reserved_room.quantity
      }
    end
    payment = PayPal::SDK::REST::Payment.new({
      intent: 'sale',
      payer: { payment_method: 'paypal' },
      redirect_urls: {
        return_url: "https://desolate-brushlands-27927.herokuapp.com/reservations/#{@reservation.id}/execute",
        cancel_url: 'https://desolate-brushlands-27927.herokuapp.com/'
      },
      transactions: {
        item_list: { items: items },
        amount: {
          total: items.map { |i| i[:price].to_f * i[:quantity] }.sum.round(2).to_s,
          currency: 'USD'
        },
        description: 'Arriendo de hostales - Clarivic'
      }
    })
    if payment.create
      redirect_to payment.links.find { |v| v.method == 'REDIRECT' }.href
    else
      render json: payment.error
    end
  end

  def execute
    paypal_payment = PayPal::SDK::REST::Payment.find(params[:paymentId])
    if paypal_payment.execute(payer_id: params[:PayerID])
      @reservation = Reservation.find(params[:id])
      @reservation.update(payed: true)
      redirect_to dashboard_reservations_path, notice: "Su reservación ha sido registrada ¡Muchas gracias!"
    else
      redirect_to reservations_path, notice: "No se pudo generar el cobro en PayPal."
    end
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
    @hostel = Hostel.find(params[:hostel_id])
    @room_types = @hostel.room_types
  end

  private

  def set_date
    session[:starting_date] = params[:starting_date]
    session[:ending_date] = params[:ending_date]
  end

end
