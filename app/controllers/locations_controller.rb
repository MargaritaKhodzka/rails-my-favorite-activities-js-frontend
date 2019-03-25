class LocationsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_activities, only: %i[new create edit update]

  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
    @location.activities.build
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
    if @location = Location.find_by(id: params[:id])
      @activities = @location.activities
      render :show
    else
      redirect_to locations_path
    end
  end

  def edit
    if @location = Location.find_by(id: params[:id])
      @location.activities.build
      render :edit
    else
      redirect_to locations_path
    end
  end

  def update
    @location = Location.find_by(id: params[:id])
    if @location.update(location_params)
      redirect_to @location
    else
      render :edit
    end
  end

  private

  def location_params
    params.require(:location).permit(:name, :city, :state, :zip_code, :user_id, activity_ids:[], activities_attributes: %i[name occurrence details])
  end

  def find_activities
    @activities = current_user.activities
  end
end
