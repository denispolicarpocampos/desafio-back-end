class FileUpload
  include ActiveModel::Model

  attr_accessor :file, :user

  validates :user, presence: true
  validates :file, presence: true
  validate :file_validation

  def file_validation
    errors.add(:file, "Invalid extension") unless file.class == ActionDispatch::Http::UploadedFile && file.content_type == 'text/plain'
  end

end
