class ActivitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_location, only: %i[index new create]
  before_action :current_activity, only: %i[show edit update destroy]

  def index
    if params[:location_id]
      @activities = @location.activities
    else
      @activities = current_user.try(:activities).uniq
    end
  end

  def new
    @activity = @location.activities.build
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.location_ids = params[:location_id]
    if @activity.save
      redirect_to @activity
    else
      render :new
    end
  end

  def show
    @locations = @activity.locations
  end

  def edit
  end

  def update
    if @activity.update(activity_params)
      redirect_to @activity
    else
      render :edit
    end
  end

  def destroy
    name = @activity.name
    if @activity.delete
      redirect_to activities_path, notice: "#{name} has been successfully deleted."
    else
      render :show
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :occurrence, :time, :rating, :details)
  end

  def find_location
    @location = Location.find_by(id: params[:location_id])
  end

  def current_activity
    @activity = Activity.find_by(id: params[:id])
  end

end
