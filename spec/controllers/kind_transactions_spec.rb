require 'rails_helper'

RSpec.describe KindTransactionsController, :type => :controller do

  include Devise::Test::ControllerHelpers

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @current_user = create(:user)
    sign_in @current_user
  end

  describe 'GET /kind_transactions' do
    context "user logged" do
      it "returns status success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    context "user not logged" do
      it "redirect to sign in" do
        sign_out @current_user
        get :index
        expect(response).to redirect_to('/users/sign_in')
      end
    end
  end
end