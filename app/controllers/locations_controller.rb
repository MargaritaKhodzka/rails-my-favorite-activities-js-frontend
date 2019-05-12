class LocationsController < ApplicationController
  before_action :authenticate_user!
  before_action :current_location, only: %i[update]

  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to @location
    else
      render :new
    end
  end

  def show
    current_location
    @location_activities = @location.location_activities
  end

  def edit
    if current_location
      render :edit
    else
      redirect_to locations_path
    end
  end

  def update
    if @location.update(location_params)
      redirect_to @location
    else
      render :edit
    end
  end

  private

  def location_params
    params.require(:location).permit(:name, :city, :state, :zip_code)
  end

  def current_location
    @location = Location.find_by(id: params[:id])
  end

end
