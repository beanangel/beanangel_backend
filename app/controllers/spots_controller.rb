class SpotsController < ApplicationController

  before_action :allow_cors

  def index
    render json: Spot.all
  end

  private

    def allow_cors
      origin = Rails.env.production? ? "http://staging2.united-creative.com:9000" : 'http://localhost:9000'
      headers["Access-Control-Allow-Origin"] = origin
      headers["Access-Control-Allow-Methods"] = 'GET, POST, PUT, DELETE'
      headers["Access-Control-Allow-Headers"] =
      'Origin, Accept, Content-Type, X-Requested-With, X-CSRF-Token'

      head(:ok) if request.request_method == "OPTIONS"
      # or, render text: ''
      # if that's more your style
    end
end
