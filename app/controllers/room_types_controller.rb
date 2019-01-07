class RoomTypesController < ApplicationController
  def index

  end

  private

  def room_type_params
    params.require(:room_type).permit(%i[name description number_rooms
                                         occupied_rooms value_by_night
                                         hostel_id])
  end
end
