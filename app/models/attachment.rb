class Attachment
  include Mongoid::Document

  mount_uploader :file, AttachmentUploader
  field :content_type, type: String

  before_save :update_file_attributes

  validates :file, presence: true

  private

    def update_file_attributes
      if file.present? && file_changed?
        self.content_type = file.file.content_type
      end
    end
end
