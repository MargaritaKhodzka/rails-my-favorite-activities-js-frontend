class StaticController < ApplicationController
  before_action :authenticate_user!, only: [:favorites]

  def home
  end
end
