class ActivitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @location = Location.find_by(id: params[:location_id])
    @activities = @location.activities
  end
end
