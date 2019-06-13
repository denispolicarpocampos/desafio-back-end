require 'rails_helper'

describe CreateCnabService do
  let(:user) { create(:user) }
  let(:upload) { build(:file_upload, user: user) }
  let(:file) { File.read(upload.file) }

  subject do
    described_class.new(file, user.id).call
  end

  context "result without errors" do

    it 'save on transaction value table' do
      expect{ subject }.to change{ TransactionValue.count }.by(file.lines.count)
    end

  end

  context "result with errors" do
    # it 'raise StandardError' do
    #   file_string = SecureRandom.alphanumeric(82)
    #   expect(described_class).to receive(:new).with(file_string, user.id).and receive(:call)
    #   described_class.new(file_string, user.id).call
    # end

    # it 'file with lines greater than 81'
    #   expect(described_lass.new(file.lines))
    # end
  end
end