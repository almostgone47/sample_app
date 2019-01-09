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
    visit "/static_pages/home"
    expect(page).to have_title 'Home | Ruby on Rails Tutorial Sample App'
  end
  
  it "should have the correct title" do
    visit "/static_pages/help"
    expect(page).to have_title 'Help | Ruby on Rails Tutorial Sample App'
  end

  it "should have the correct title" do
    visit "/static_pages/about"
    expect(page).to have_title 'About | Ruby on Rails Tutorial Sample App'
  end

  it "shoud have the correct title" do
    visit '/static_pages/contact'
    expect(page).to have_title 'Contact | Ruby on Rails Tutorial Sample App'
  end

end
