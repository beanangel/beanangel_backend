class SpotSerializer < ActiveModel::Serializer
  attributes :id, :location, :name, :description

  # Making sure MongoDB ID's aren't supported with $oid but as simple strings instead
  def id
    object.id.to_s
  end
end
