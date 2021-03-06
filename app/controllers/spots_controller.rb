class SpotsController < ApplicationController

  before_action :check_for_iframe_transport, only: [:create, :update]

  def index
    render json: Spot.all
  end

  def create
    @spot = Spot.create(spot_params)
    if @is_iframe_transport
      # html is only for jquery.iframe-transport, once that is gone, remove this and the whole if/else
      render format: :html
    else
      render json: @spot
    end
  end

  def update
    @spot = Spot.find(params[:id])
    @spot.update_attributes(spot_params)
    if @is_iframe_transport
      # html is only for jquery.iframe-transport, once that is gone, remove this and the whole if/else
      render format: :html
    else
      render json: @spot
    end
  end

  private

    # This is only for jquery.iframe-transport, once that is gone, remove this.
    # Check the following link to see, why we have a special rendering for this jquery transport
    # @see http://cmlenz.github.io/jquery-iframe-transport/#section-9
    def check_for_iframe_transport
      # Check whether this comes from jquery.iframe-transport
      # Eventually we're only supporting application/json so we expect X-HTTP-Accept to be just that
      @is_iframe_transport =  params.delete('X-Requested-With') == 'IFrame' &&
                              params.delete('X-HTTP-Accept').starts_with?("application/json")
    end

    def spot_params
      attrs = params.require(:properties).dup

      # get coordinates if present
      if params[:geometry] && (coords = params[:geometry][:coordinates]).present?
        attrs[:location] = coords
      end

      # set the location query to the model's address field as long as we don't have
      # reverse geocoding implemented.
      attrs[:address] = attrs.delete(:location_query)

      # now specify permissible parameters for StrongParameters
      attrs = attrs.permit(:location_query, :address, :title, :description, :username, attachments: [])

      # TODO move to model level
      # Done after #permit because Attachment is not a type that is allowed by StrongParameters
      # build Attachment documents from uploaded files
      if attrs[:attachments]
        attrs[:attachments] = attrs[:attachments].map {|a| Attachment.new(file: a) }

        # this might also be an existing spot with existing attachments
        if @spot && @spot.attachments.present?
          attrs[:attachments] = @spot.attachments | attrs[:attachments]
        end
      end

      attrs
    end
end
