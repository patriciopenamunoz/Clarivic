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

end
