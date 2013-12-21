class Spot
  include Mongoid::Document
  include Geocoder::Model::Mongoid

  field :title, type: String
  field :location, type: Array
  mount_uploader :photo, PhotoUploader
  field :username, type: String
  field :address, type: String
  field :city, type: String
  field :state, type: String
  field :description, type: String

  geocoded_by :address, :coordinates => :location
  after_validation :geocode, if: ->(obj){ obj.address.present? && obj.address_changed? }

  validates :title, presence: true
  validates :location, presence: true
  validates :username, presence: true
end
