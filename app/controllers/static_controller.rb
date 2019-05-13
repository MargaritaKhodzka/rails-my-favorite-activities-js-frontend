class StaticController < ApplicationController
  before_action :authenticate_user!, only: [:favorites]

  def home
  end

  def user_favorites
    @favorites = current_user.location_activities.favorite_activities
  end
end
