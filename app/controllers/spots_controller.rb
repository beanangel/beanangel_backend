class SpotsController < ApplicationController

  before_action :allow_cors

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

  private

    def allow_cors
      origin = Rails.env.production? ? "http://staging2.united-creative.com" : 'http://localhost:9000'
      headers["Access-Control-Allow-Origin"] = origin
      headers["Access-Control-Allow-Methods"] = 'GET, POST, PUT, DELETE'
      headers["Access-Control-Allow-Headers"] =
      'Origin, Accept, Content-Type, X-Requested-With, X-CSRF-Token'

      head(:ok) if request.request_method == "OPTIONS"
      # or, render text: ''
      # if that's more your style
    end
end
