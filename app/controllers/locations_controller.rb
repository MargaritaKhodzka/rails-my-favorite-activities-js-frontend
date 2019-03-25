class LocationsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_activities, only: %i[new create edit update]
  before_action :current_location, only: [:update]

  def index
    @locations = Location.all
  end

  def new
    @location = Location.new(user_id: current_user.id)
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
    if current_location
      @activities = @location.activities
      render :show
    else
      redirect_to locations_path
    end
  end

  def edit
    if current_location
      @location.activities.build
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
    params.require(:location).permit(:name, :city, :state, :zip_code, :user_id, activity_ids:[], activities_attributes: %i[name occurrence details])
  end

  def find_activities
    @activities = current_user.activities
  end

  def current_location
    @location = Location.find_by(id: params[:id])
  end
end
