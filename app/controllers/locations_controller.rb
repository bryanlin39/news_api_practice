class LocationsController < ApplicationController
  def show
    @location = Location.find(params[:id])
    json_response(@location)
  end
end
