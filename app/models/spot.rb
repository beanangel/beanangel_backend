class Spot
  include Mongoid::Document
  include Geocoder::Model::Mongoid

  field :title, type: String
  field :location, type: Array
  field :username, type: String
  field :address, type: String
  field :city, type: String
  field :state, type: String
  field :description, type: String

  embeds_many :attachments, cascade_callbacks: true
  
  geocoded_by :address, :coordinates => :location
  after_validation :geocode, if: ->(obj){ obj.address.present? && obj.address_changed? }


  validates :title, presence: true
  validates :attachments, presence: true
  validates :location, presence: true
  validates :username, presence: true
end
