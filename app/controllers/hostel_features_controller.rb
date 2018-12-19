class HostelFeaturesController < ApplicationController
  def index
    @hostel_features = HostelFeature.where(hostel_id: params[:hostel_id]).order(id: :desc)
    @hostel = Hostel.find(params[:hostel_id])
    @hostel_feature = HostelFeature.new
  end

  def create
    params[:hostel_feature][:hostel_id] = params[:hostel_id]
    @hostel_feature = HostelFeature.create(hostel_feature_params)

    respond_to do |format|
      format.js
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
    @hostel_feature.update(hostel_feature_params)
    respond_to do |format|
      format.js
    end
  end

  def destroy
  end

  private

  def hostel_feature_params
    params.require(:hostel_feature).permit(%i[title description image hostel_id])
  end
end
