class ApiController < ApplicationController
  def region
    @region = Region.find(params[:id])
    @json = {
      region: @region,
      communes: @region.communes
    }

    render json: @json.to_json
  end
end
