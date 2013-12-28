class SearchResult
  include Mongoid::Document

  embedded_in :search

  field :latitude, type: Float
  field :longitude, type: Float
  field :address, type: String
  field :city, type: String
  field :province, type: String
  field :state_code, type: String
  field :postal_code, type: String
  field :country, type: String
  field :country_code, type: String

  validates_presence_of :latitude, :longitude


  def self.result_fields
    fields.except('_id').keys
  end
end