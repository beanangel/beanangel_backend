class SpotsController < ApplicationController

  def index
    render json: Spot.all
  end

  def create
    @spot = Spot.create(spot_params)
    render json: @spot
  end

  def update
    @spot = Spot.find(params[:id])
    @spot.update_attributes(spot_params)
    render json: @spot
  end

  private

    def spot_params
      attrs = params[:spot].dup
      attrs.delete(:location)
      attrs
    end
end
