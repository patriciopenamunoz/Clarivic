class HostelFeaturesController < ApplicationController
  include ApplicationHelper
  before_action :authenticate_user!

  def index
    @hostel_features = HostelFeature.where(hostel_id: params[:hostel_id]).order(id: :desc)
    @hostel = Hostel.find(params[:hostel_id])
    @hostel_feature = HostelFeature.new
  end

  def create
    params[:hostel_feature][:hostel_id] = params[:hostel_id]
    unless params[:hostel_feature][:image].nil?
      @hostel_feature = HostelFeature.new(hostel_feature_params)
      if @hostel_feature.save
      respond_to do |format|
        format.js
      end
      else
        sendError @hostel_feature
      end
    else
      render js: "showToastr('error', 'Falta subir una imagen.')"
    end
  end

  def edit
    @hostel = Hostel.find(params[:hostel_id])
    @hostel_feature = HostelFeature.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  def update
    @hostel_feature = HostelFeature.find(params[:id])
    if @hostel_feature.update(hostel_feature_params)
      respond_to do |format|
        format.js
      end
    else
      sendError @hostel_feature
    end
  end

  def destroy
    @hostel_feature = HostelFeature.find(params[:id])
    @hostel_feature.destroy
    respond_to do |format|
      format.js
    end
  end

  private

  def hostel_feature_params
    params.require(:hostel_feature).permit(%i[title description image hostel_id])
  end
end
