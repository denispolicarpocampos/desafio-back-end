require 'rails_helper'

RSpec.describe FileUploadsController, :type => :controller do

  include Devise::Test::ControllerHelpers

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @current_user = create(:user)
    sign_in @current_user
  end

  describe 'GET /file_uploads/new' do
    context "user logged" do
      it "returns status success" do
        get :new
        expect(response).to have_http_status(:success)
      end
    end

    context "user not logged" do
      it "redirect to sign in" do
        sign_out @current_user
        get :new
        expect(response).to redirect_to('/users/sign_in')
      end
    end
  end

  describe 'POST /file_uploads' do
    context 'file is valid' do
      let(:upload) { build(:file_upload) }

      before(:each) do
        post :create, params: { file_upload: { file: upload.file } }
      end

      it "redirect to kind transactions" do
        expect(response).to redirect_to('/file_uploads/new')
      end
    end

    context 'file is not valid' do
      let(:upload) { build(:file_upload, file: Rack::Test::UploadedFile.new(Rails.root.join('spec/support/CNAB.txt'), 'image/jpeg')) }

      before(:each) do
        post :create, params: { file_upload: { file: upload.file } }
      end

      it "redirect to file upload new" do
        expect(response).to redirect_to('/file_uploads/new')
      end
    end

    context 'user is not logged' do
      let(:upload) { build(:file_upload) }
      
      before(:each) do
        sign_out @current_user
        post :create, params: { file_upload: { file: upload.file } }
      end

      it "redirect to kind transactions" do
        expect(response).to redirect_to('/users/sign_in')
      end
    end
  end
end