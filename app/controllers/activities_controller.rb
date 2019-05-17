class ActivitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :current_activity, only: %i[show update destroy]

  def index
    @activities = current_user.activities
  end

  def new
    @activity = Activity.new
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
    @user_activities = @activity.user_activities.sort_activities
    @user_activity = UserActivity.new
  end

  def edit
    if current_activity
      render :edit
    else
      redirect_to activities_path
    end
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
    params.require(:activity).permit(:name, :user_id)
  end

  def current_activity
    @activity = Activity.find(params[:id])
  end

end
