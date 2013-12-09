class SpotsController < ApplicationController
  def index
    render json: Spot.all
  end
end
