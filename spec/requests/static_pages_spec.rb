require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe "GET /static_pages/home" do
    it "works! (home)" do
      get static_pages_home_path
      expect(response).to have_http_status(200)
    end
    it "should have the title 'Home'" do
      get static_pages_home_path
			expect(response).to have_title("Home")
		end
  end
  describe "GET /static_pages/help" do
    it "works! (help)" do
      get static_pages_help_path
      expect(response).to have_http_status(200)
    end
    it "should have the title 'Help'" do
      get static_pages_help_path
			expect(response).to have_title("Help")
		end
  end
  describe "GET /static_pages/about" do
    it "works! (about)" do
      get static_pages_about_path
      expect(response).to have_http_status(200)
    end
    it "should have the title 'About'" do
      get static_pages_about_path
			expect(response).to have_title("About")
		end
  end
end
