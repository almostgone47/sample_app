require 'rails_helper'

RSpec.describe "UsersLogins", type: :request do
  describe "GET /login" do
		it "returns http success" do
  		user = User.create(email: "almostgoen47@hotmail.com", password: "123456")
  		post login_path user: { session[:email] => user.email, session[:password] => user.password }
  		expect(response).to have_http_status(:success)
		end
  end
end
