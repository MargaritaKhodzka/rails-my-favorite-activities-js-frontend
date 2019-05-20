class LocationActivitiesController < ApplicationController
  before_action :find_activity, only: %i[new create]
  def new
    @location_activity = LocationActivity.new(activity_id: params[:activity_id])
  end

  def create
    @location_activity = LocationActivity.new(location_activity_params)
    if @location_activity.save
      redirect_to activity_path(@activity)
    else
      render :new
    end
  end

  private

  def location_activity_params
    params.require(:location_activity).permit(:location_id, :activity_id, :rating, :details)
  end

  def find_activity
    @activity = Activity.find_by(id: params[:activity_id])
  end
end
