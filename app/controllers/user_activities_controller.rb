class UserActivitiesController < ApplicationController

  def new
    @user_activity = UserActivity.new(activity_id: params[:activity_id])
  end

  def create
    find_activity
    @user_activity = UserActivity.new(user_activity_params)
    if @user_activity.save
      redirect_to activity_path(@activity)
    else
      render :new
    end
  end

  private

  def user_activity_params
    params.require(:user_activity).permit(:location_id, :activity_id, :rating, :details)
  end

  def find_activity
    @activity = Activity.find_by(id: params[:activity_id])
  end

end
