class ReservedRoomsController < ApplicationController
  def update
    @reserved_room = ReservedRoom.find(params[:id])
    @reservation = @reserved_room.reservation
    @room_type = @reserved_room.room_type
    date_hash = @reserved_room.reservation.date_hash
    quantity = params[:reserved_room][:quantity].to_i
    unless quantity.zero?
      if @room_type.rooms_left_in_range(date_hash) >= quantity
        @reserved_room.update(quantity: quantity)
      end
    end
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @reserved_room = ReservedRoom.find(params[:id])
    @reservation = @reserved_room.reservation
    @reserved_room.destroy
    @reservation.destroy if @reservation.reserved_rooms.size.zero?
    redirect_to reservations_path
  end
end
