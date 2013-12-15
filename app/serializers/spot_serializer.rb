# Serializing spots compliant to the GeoJSON standard
# @see http://geojson.org/geojson-spec.html
class SpotSerializer < ActiveModel::Serializer
  attributes :id, :type, :properties, :geometry, :errors

  # Making sure MongoDB ID's aren't supported with $oid but as simple strings instead
  # @return MongoDB ID [String]
  def id
    object.id.to_s
  end

  # @see http://geojson.org/geojson-spec.html#feature-objects
  # @return the GeoJSON object type "Feature" [String]
  def type
    "Feature"
  end

  def properties
    {name: object.name, description: object.description}
  end

  # @see http://geojson.org/geojson-spec.html#geometry-objects
  # @return GeoJSON geometry [Hash]
  def geometry
    {type: geometry_type, coordinates: object.location}
  end

  # @see http://geojson.org/geojson-spec.html#point
  # @return GeoJSON geometry type "Point" [String]
  def geometry_type
    "Point"
  end

  # @override used to determine what attributes and associations should be included in the output
  # @return the attribute keys that should be included in the output [Array]
  def filter(keys)
    keys.delete(:errors) if object.errors.blank?
    keys
  end
end
