require 'rails_helper'

RSpec.describe FileUpload, type: :model do
  describe 'validations' do
    subject { build(:file_upload) }
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:user) }
    it { should_not allow_value('').for(:file) }
    it { should_not allow_value(Rack::Test::UploadedFile.new(Rails.root.join('spec/support/CNAB.txt'), 'image/jpeg') ).for(:file) }
  end
end
