class LocationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def location_params
    params.require(:location).permit(:name, :city, :state, :zip_code)
  end

end
