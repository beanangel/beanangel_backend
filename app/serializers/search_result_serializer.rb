class SearchResultSerializer < BaseSerializer
  attributes :id, :latitude, :longitude, :address, :city, :province, :state, :postal_code, :country, :country_code

  # Geocoder::Results::Ovi#state returns address_data['County']
  # which isn't true for Germany for example. So instead we're returning
  # Geocoder::Results::Ovi#state_code which is address_data['State']
  def state
    object.state_code
  end
end
