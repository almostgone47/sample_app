require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  describe "GET root" do
    it "returns the root path" do
      visit '/'
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #help" do
    it "returns http success" do
      get :help
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #contact" do
    it "returns http success" do
      get :contact
      expect(response).to have_http_status(:success)
    end
  end

  render_views

  it "should have the correct title" do
    visit root_path
    expect(page.title).to eq('Ruby on Rails Tutorial Sample App')
  end
  
  it "should have the correct title" do
    visit help_path
    expect(page.title).to eq('Help | Ruby on Rails Tutorial Sample App')
  end

  it "should have the correct title" do
    visit about_path
    expect(page.title).to eq('About | Ruby on Rails Tutorial Sample App')
  end

  it "should have the correct title" do
    visit contact_path
    expect(page.title).to eq('Contact | Ruby on Rails Tutorial Sample App')
  end

  it "should have the correct title" do
    visit signup_path
    expect(page.title).to eq('Sign up | Ruby on Rails Tutorial Sample App')
  end

end
