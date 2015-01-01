require 'rails_helper'

RSpec.describe AuthenticationController, :type => :controller do

  describe "GET login" do
    it "returns http success" do
      get :login
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET signin" do
    it "returns http success" do
      get :signin
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET auth" do
    it "returns http success" do
      get :auth
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET logout" do
    it "returns http success" do
      get :logout
      expect(response).to have_http_status(:success)
    end
  end

end
