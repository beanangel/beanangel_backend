class BaseSerializer < ActiveModel::Serializer
  attributes :id

  # Making sure MongoDB ID's aren't serialized with $oid but as simple strings instead
  # @return MongoDB ID [String]
  def id
    object.id.to_s
  end
end