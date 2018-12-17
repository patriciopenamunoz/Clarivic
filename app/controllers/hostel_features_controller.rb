class HostelFeaturesController < ApplicationController
  def index
    @hostel_features = HostelFeature.find_by(hostel_id: params[:hostel_id])
    @hostel_features = [] if @hostel_features.nil?
    @hostel = Hostel.find(params[:hostel_id])
    @hostel_feature = HostelFeature.new
  end

  def create
    params[:hostel_feature][:hostel_id] = params[:hostel_id]
    @hostel_feature = HostelFeature.create(hostel_feature_params)
  end

  def update
  end

  def destroy
  end

  private

  def hostel_feature_params
    params.require(:hostel_feature).permit(%i[title description image hostel_id])
  end
end
