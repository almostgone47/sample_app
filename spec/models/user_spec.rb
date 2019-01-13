require 'rails_helper'

RSpec.describe User, type: :model do
  attr_accessor :password
  before do
  	@user = User.new(name: "Example", email: "example@gmail.com",
  		               password: "foobar", password_confirmation: "foobar")
  end

	it "returns false if password length is not at least 6 chars" do
		@user.password = "a"
		@user.save
		expect(@user.errors.messages).to include{"is too short"}
	end

  describe "test validations" do
  	it "should return true if user is valid" do
  		expect(@user.valid?).to eq(true)
  	end
  end

	it "returns false if name is not present" do
		@user.name = " "
		expect(@user.valid?).to eq(false)
	end

	it "returns false if password is not present" do
		@user.password = " "
		expect(@user.valid?).to eq(false)
	end

	it "returns false if email is not present" do
		@user.email = ""
		expect(@user.valid?).to eq(false)
	end


	it "checks name is less than 50 characters" do
		@user.name = "a" * 51 
		expect(@user.valid?).to eq(false)
	end

	it "checks email is less than 255 characters" do
		@user.email = "a" * 245 + "@example.com"
		expect(@user.valid?).to eq(false)
	end

	valid_addresses = %w[user@example.com USER@foo.COM
		                   A_US-ER@foo.bar.org first.last@foo.jp
		                   alice+bob@baz.cn]
	valid_addresses.each do |valid_address|
		it "accepts only #{valid_address} formats" do
			@user.email = valid_address
			expect(@user.valid?).to eq(true)
		end
	end

	invalid_addresses = %w[user@example,com user_at_foo.org
	                       user.name@example. foo@bar_baz.com
	                       foo@bar+baz.com]
	invalid_addresses.each do |invalid_address|
		it "doesn't accept #{invalid_address} formats" do
	  	@user.email = invalid_address
	  	expect(@user.valid?).to eq(false)
	  end
	end

	it "returns false if email address is not unique" do
		duplicate_user = User.create(name: "Example", email: "example@gmail.com",
  		               password: "foobar", password_confirmation: "foobar")
		expect(@user.valid?).to eq(false)
	end

	it "checks case insensitivity" do
		@user.email = 'DrDoLittle@GMail.coM'
		@user.save
		expect(@user.email).to eq('drdolittle@gmail.com')
	end
end
