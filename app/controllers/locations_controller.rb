class LocationsController < ApplicationController
  def index
    @locations = Location.all
    json_response(@locations)
  end

  def show
    @location = Location.find(params[:id])
    json_response(@location)
  end

  def create
    @location = Location.create!(location_params)
    json_response(@location, :created)
  end

  def update
    @location = Location.find(params[:id])
    if @location.update!(location_params)
      json_response(@location, :accepted)
    else
      render status: 400, json: {
        message: 'Location has not been updated.'
      }
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.articles.each do |a|
      a.destroy
    end
    @location.destroy
    render status: 200, json: {
      message: "Location has been deleted."
    }
  end

private

  def location_params
    params.permit(:name, :latitude, :longitude)
  end

end
