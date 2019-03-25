class ActivitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_location, only: %i[index new create]

  def index
    @location = Location.find_by(id: params[:location_id])
    @activities = @location.activities
  end

  def new
    @location = Location.find_by(id: params[:location_id])
    @activity = @location.activities.build
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.location_ids = params[:location_id]
    @location = Location.find_by(id: params[:location_id])
    if @activity.save
      redirect_to @activity
    else
      render :new
    end
  end

  def show
    @activity = Activity.find_by(id: params[:id])
    @locations = @activity.locations
  end

  def edit
    @activity = Activity.find_by(id: params[:id])
  end

  def update
    @activity = Activity.find_by(id: params[:id])
    if @activity.update(activity_params)
      redirect_to @activity
    else
      render :edit
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :occurrence, :details)
  end

  def find_location
    @location = Location.find_by(id: params[:location_id])
  end
end
