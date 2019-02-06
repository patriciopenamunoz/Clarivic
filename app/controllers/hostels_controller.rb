class HostelsController < ApplicationController
  include ApplicationHelper
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :set_hostel, only: [:show, :edit, :update, :destroy]
  before_action :set_regions, only: [:index, :new, :edit]

  # GET /hostels
  # GET /hostels.json
  def index
    @chile = { latitude: -31.7613365, longitude: -71.3187697 }
    @region_id = params.has_key?(:region_id) ? params[:region_id] : '-1'
    mode = params[:form_mode] || 'form'

    if mode == 'form'
      if (@region_id != "-1")
        if (params.has_key?(:commune_id)) && (params[:commune_id] != "-1")
          @hostels = Commune.find(params[:commune_id]).hostels
        else
          @hostels = Region.find(params[:region_id]).hostels
        end
      else
        @hostels = Hostel.all
      end
    elsif mode == 'map'
      @hostels = Hostel.where(id: params[:hostels_id])
    end

    @hostels = @hostels.map do |h|
      if (h.rooms_left_in_range starting_date: tDate(session[:starting_date]),
                                ending_date: tDate(session[:ending_date])).positive?
        return h
      end
    end

    respond_to do |format|
      format.html
      format.js
      format.json
    end
  end

  # GET /hostels/1
  # GET /hostels/1.json
  def show
    @room_types = @hostel.room_types
    @can_comment = false
    if user_signed_in?
      hostel_registration = @hostel.hostel_registrations.find_by(user: current_user)
      if hostel_registration
        unless hostel_registration.reservations.select { |r| (r.payed && r.started?) }.count.zero?
          @can_comment = true
        end
      end
    end
  end

  # GET /hostels/new
  def new
    @hostel = Hostel.new
  end

  # GET /hostels/1/edit
  def edit
    @communes = @hostel.region.communes
  end

  # POST /hostels
  # POST /hostels.json
  def create
    @regions = Region.all
    @hostel = Hostel.new(hostel_params)
    if @hostel.valid?
      unless params[:hostel][:principal_image].nil?
        geocoder = Geocoder.search(@hostel.full_address)
        unless geocoder.count.zero?
          (@hostel.latitude, @hostel.longitude) = geocoder.first.coordinates
          @hostel_registration = HostelRegistration.new
          @hostel_registration.user = current_user
          @hostel_registration.hostel = @hostel
          @hostel_registration.admin!
          respond_to do |format|
            format.html { redirect_to dashboard_hostels_path, notice: 'Hostal registrado correctamente.' }
            format.json { render :show, status: :created, location: @hostel }
          end
        else
          render js: "showToastr('error', 'La dirección no es válida.')"
        end
      else
        render js: "showToastr('error', 'Falta subir una imagen.')"
      end
    else
      sendError @hostel
    end
  end

  # PATCH/PUT /hostels/1
  # PATCH/PUT /hostels/1.json
  def update
    respond_to do |format|
      if @hostel.valid?
        geocoder = Geocoder.search(@hostel.address)
        unless geocoder.count.zero?
          (@hostel.latitude, @hostel.longitude) = geocoder.first.coordinates
          @hostel.update(hostel_params)
          format.html { redirect_to dashboard_hostels_path, notice: 'El hostal ha sido actualizado.' }
          format.json { render :show, status: :ok, location: @hostel }
        else
          render js: "showToastr('error', 'La dirección no es válida.')"
        end
      else
        sendError @hostel
      end
    end
  end

  # DELETE /hostels/1
  # DELETE /hostels/1.json
  def destroy
    @hostel.hostel_registrations.destroy_all
    @hostel.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_hostels_path, notice: 'El hostal fue eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hostel
      @hostel = Hostel.find(params[:id])
    end

    def set_regions
      @regions = Region.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hostel_params
      params.require(:hostel).permit(:user_id, :name, :address, :address_number, :commune_id, :principal_image, :description)
    end
end
