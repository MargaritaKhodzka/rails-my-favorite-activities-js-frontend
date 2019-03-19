class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
    @location.activities.build
    @activities = Activity.all
  end
end
