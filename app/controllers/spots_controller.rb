class SpotsController < ApplicationController

  include ActionController::MimeResponds # for respond_to, remove this once jquery.iframe-transport is gone

  def index
    render json: Spot.all
  end

  def create
    @spot = Spot.create(spot_params)
    respond_to do |format|
      # html is only for jquery.iframe-transport, once that is gone, remove this
      format.html { render_for_iframe_transport }
      format.any(:js, :json) {
        render json: @spot
      }
    end
  end

  def update
    @spot = Spot.find(params[:id])
    @spot.update_attributes(spot_params)
    respond_to do |format|
      # html is only for jquery.iframe-transport, once that is gone, remove this
      format.html { render_for_iframe_transport }
      format.any(:js, :json) {
        render json: @spot
      }
    end
  end

  private

    # This is only for jquery.iframe-transport, once that is gone, remove this.
    # Check the following link to see, why we have a special rendering for this jquery transport
    # @see http://cmlenz.github.io/jquery-iframe-transport/#section-9
    def render_for_iframe_transport
      # Check whether this comes from jquery.iframe-transport
      # Eventually we're only supporting application/json so we except X-HTTP-Accept to be just that
      if  params.delete('X-Requested-With') == 'IFrame' &&
          params.delete('X-HTTP-Accept').starts_with?("application/json")
        render action_name, format: :html
      else
        render nothing: true
      end
    end

    def spot_params
      attrs = params[:spot].dup
      attrs.delete(:location)
      attrs
    end
end
