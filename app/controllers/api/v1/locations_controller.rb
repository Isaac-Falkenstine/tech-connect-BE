class Api::V1::LocationsController < ApplicationController

  def index
    locations = Location.all

    render json: LocationSerializer.new(locations)
  end

end
