class LocationActivitiesController < ApplicationController
  def new
    @location_activity = LocationActivity.new(activity_id: params[:activity_id])
  end

  def create
    set_activity
    @location_activity = LocationActivity.new(location_activity_params)
    if @location_activity.save
      redirect_to activity_path(@activity)
    else
      render :new
    end
  end

  def show
    @location_activity = LocationActivity.find(params[:id])
  end

  private

  def location_activity_params
    params.require(:location_activity).permit(:location_id, :activity_id, :rating, :details)
  end

  def set_activity
    @activity = Activity.find(params[:activity_id])
  end
end