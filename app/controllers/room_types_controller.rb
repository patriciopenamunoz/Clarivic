class RoomTypesController < ApplicationController
  include ApplicationHelper
  before_action :authenticate_user!

  def index
    @room_types = RoomType.where(hostel_id: params[:hostel_id])
  end

  def new
    @hostel = Hostel.find(params[:hostel_id])
    @room_type = RoomType.new
    respond_to do |format|
      format.js
    end
  end

  def edit
    @hostel = Hostel.find(params[:hostel_id])
    @room_type = RoomType.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  def create
    params[:room_type][:hostel_id] = params[:hostel_id]
    unless params[:room_type][:image].nil?
      @room_type = RoomType.new(room_type_params)
      if @room_type.save
      respond_to do |format|
        @room_types = RoomType.where(hostel_id: params[:hostel_id])
        format.js
      end
      else
        sendError @room_type
      end
    else
      render js: "showToastr('error', 'Falta subir una imagen.')"
    end
  end

  def update
    @room_type = RoomType.find(params[:id])
    if @room_type.update(room_type_params)
      respond_to do |format|
        format.js
      end
    else
      sendError @room_type
    end
  end

  def destroy
    @room_type = RoomType.find(params[:id])
    @room_type.destroy
    respond_to do |format|
      format.js
    end
  end

  private

  def room_type_params
    params.require(:room_type).permit(%i[name description number_rooms
                                         occupied_rooms value_per_night
                                         hostel_id image])
  end
end
