# Serializing spots compliant to the GeoJSON standard
# @see http://geojson.org/geojson-spec.html
class SpotSerializer < BaseSerializer
  attributes :id, :type, :properties, :geometry, :errors

  # @see http://geojson.org/geojson-spec.html#feature-objects
  # @return the GeoJSON object type "Feature" [String]
  def type
    "Feature"
  end

  # @return properties of the spot apart from geometry and type [Hash]
  def properties
    {
      title: object.title,
      attachments: serialized_attachments,
      username: object.username,
      description: object.description
    }
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

  # @return attachments run through their specific ActiveModel::Serializer [ActiveModel::ArraySerializer]
  def serialized_attachments
    ActiveModel::ArraySerializer.new(object.attachments)
  end

  # @override used to determine what attributes and associations should be included in the output
  # @return the attribute keys that should be included in the output [Array]
  def filter(keys)
    keys.delete(:errors) if object.errors.blank?
    keys
  end
end
