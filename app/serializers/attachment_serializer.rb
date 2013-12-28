class AttachmentSerializer < BaseSerializer
  attributes :id, :file, :thumb, :content_type

  def file
    object.file.url
  end

  def thumb
    object.file.thumb.url
  end
end
