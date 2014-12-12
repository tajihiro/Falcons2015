require 'rails_helper'

RSpec.describe MemberController, :type => :controller do

  describe "GET members" do
    it "returns http success" do
      get :members
      expect(response).to have_http_status(:success)
    end
  end

end
