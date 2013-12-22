class AttachmentSerializer < ActiveModel::Serializer
  attributes :id, :file, :thumb, :content_type

  # Making sure MongoDB ID's aren't serialized  with $oid but as simple strings instead
  # @return MongoDB ID [String]
  def id
    object.id.to_s
  end

  def file
    object.file.url
  end

  def thumb
    object.file.thumb.url
  end
end
