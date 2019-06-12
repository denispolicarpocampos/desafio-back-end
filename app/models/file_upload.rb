class FileUpload
  include ActiveModel::Model
  extend CarrierWave::Mount

  attr_accessor :file, :user
  mount_uploader :file, FileAttachUploader
  validates :file, presence: true
end
