class LocationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
    @location.activities.build
    @activities = Activity.all
  end

  def create
    @location = Location.new(location_params)
    @activities = Activity.all
    if @location.save
      redirect_to @location
    else
      render :new
    end
  end

  def show
    if @location = Location.find_by(id: params[:id])
      @activities = @location.activities
      render :show
    else
      redirect_to locations_path
    end
  end

  private

  def location_params
    params.require(:location).permit(:name, :city, :state, :zip_code, :user_id, activity_ids:[], activities_attributes: [:name, :occurrence, :details])
  end
end
