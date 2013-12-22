class Spot
  include Mongoid::Document
  include Mongoid::Geospatial

  field :title, type: String
  field :location, type: Point
  field :username, type: String
  field :address, type: String
  field :city, type: String
  field :state, type: String
  field :description, type: String

  embeds_many :attachments, cascade_callbacks: true

  validates :title, presence: true
  validates :attachments, presence: true
  validates :location, presence: true
  validates :username, presence: true

  sphere_index :location
end
