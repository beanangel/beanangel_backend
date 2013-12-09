class Spot
  include Mongoid::Document
  include Mongoid::Geospatial

  field :location, type: Point
  field :address, type: String
  field :city, type: String
  field :state, type: String
  field :name, type: String
  field :description, type: String

  sphere_index :location


  validates :location, presence: true
end
