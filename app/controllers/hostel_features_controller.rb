class HostelFeaturesController < ApplicationController
  def index
    @hostel_features = HostelFeature.find_by(hostel_id: params[:hostel_id])
    @hostel_features = [] if @hostel_features.nil?
    @hostel = Hostel.find(params[:hostel_id])
    @hostel_feature = HostelFeature.new
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def hostel_feature_params
    params.require(:hostel_feature).permit([:title, :description, :image])
  end
end
