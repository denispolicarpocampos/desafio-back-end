class FileUpload
  include ActiveModel::Model

  attr_accessor :file, :user
  validates :file, presence: true
  validate :file_validation

  def file_validation
    errors.add(:file, "Invalid extension") unless file.content_type == 'text/plain'
  end
end
