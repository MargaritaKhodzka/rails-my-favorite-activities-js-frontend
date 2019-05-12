class ActivitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @activities = current_user.activities
  end

  def new
    @activity = Activity.new(user_id: current_user.id)
  end

  def create
    @activity = current_user.activities.new(activity_params)
    if @activity.save
      redirect_to @activity
    else
      render :new
    end
  end

  def show
    current_activity
    @location_activities = @activity.location_activities
    @location_activity = LocationActivity.new
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :user_id)
  end

  def current_activity
    @activity = Activity.find(params[:id])
  end

end
