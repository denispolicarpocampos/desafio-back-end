FactoryBot.define do
  factory :file_upload do
    file { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/CNAB.txt'), 'text/plain') }
    user
  end
end
