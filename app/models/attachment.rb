class Attachment
  include Mongoid::Document

  mount_uploader :file, PhotoUploader

  validates :file, presence: true
end
