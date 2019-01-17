require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #new" do
    it "returns http success" do
      post :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "delete session" do
    it "returns http success" do
      delete :destroy
      expect(response).to have_http_status(:success)
    end
  end

end
