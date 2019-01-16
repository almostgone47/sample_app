require 'rails_helper'

RSpec.describe "UsersSignups", type: :request do
  describe "invalid signup" do
    it "outputs zero new users" do
      post signup_path "user" => { name: "",
      													  email: "user@invalid",
      													  password: "foo",
      													  password_confirmation: "bar" }
      expect(User.count).to eq(0)
    end

    it "outputs zero new users" do
      post signup_path "user" => { name: "Jeremiah",
      													  email: "user@valid.com",
      													  password: "foobar",
      													  password_confirmation: "foobar" }
      expect(User.count).to eq(1)
    end

  end
end
