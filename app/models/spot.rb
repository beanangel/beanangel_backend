class Spot
  include Mongoid::Document
  include Mongoid::Geospatial

  field :title, type: String
  field :location, type: Point
  mount_uploader :photo, PhotoUploader
  field :username, type: String
  field :address, type: String
  field :city, type: String
  field :state, type: String
  field :description, type: String

  validates :title, presence: true
  validates :location, presence: true
  validates :username, presence: true

  sphere_index :location
end
