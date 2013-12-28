class SearchResult
  include Mongoid::Document

  embedded_in :search

  field :latitude, type: Float
  field :longitude, type: Float
  field :bounds, type: Hash
  field :address, type: String
  field :city, type: String
  field :province, type: String
  field :state_code, type: String
  field :postal_code, type: String
  field :country, type: String
  field :country_code, type: String

  validates_presence_of :latitude, :longitude


  def self.build_from_geocoder(geocoder_result)
    attrs = result_fields.inject({}) do |hash, key|
      hash[key] = geocoder_result.send(key)
      hash
    end

    map_view = geocoder_result.data['Location']['MapView']
    attrs['bounds'] = {'SW' => map_view['BottomRight'], 'NE' => map_view['TopLeft'] }

    new(attrs)
  end

  def self.result_fields
    fields.except('_id', 'bounds').keys
  end
end