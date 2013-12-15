class SpotsController < ApplicationController

  def index
    render json: Spot.all
  end

  def create
    @spot = Spot.create(params[:spot])
    render json: @spot
  end

  def update
    @spot = Spot.find(params[:id])
    @spot.update_attributes(params[:spot])
    render json: @spot
  end
end
