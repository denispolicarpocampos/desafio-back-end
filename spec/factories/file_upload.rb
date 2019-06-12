FactoryBot.define do
  factory :file_upload do
    file ActionDispatch::Http::UploadedFile.new(File.new("#{Rails.root}/spec/fixtures/CNAB.txt"), 'plain/text')
    user
  end
end