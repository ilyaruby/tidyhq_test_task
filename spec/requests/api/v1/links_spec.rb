# spec/requests/api/v1/links_spec.rb
require 'rails_helper'

RSpec.describe "API::V1::Links", type: :request do
  def json_body
    JSON.parse(response.body)
  end

  describe "POST /api/v1/links" do
    it "creates a new short link and returns it" do
      post '/api/v1/links', params: { link: { original_url: "https://example.com" } }
      expect(response).to have_http_status(201)
      expect(json_body['short_url']).to be_present
    end
  end

  describe "GET /api/v1/:short_url" do
    let!(:link) { create(:link, original_url: "https://example.com", short_url: "xyz789") }

    it "shows the original URL" do
      get "/api/v1/links/#{link.short_url}"
      expect(response).to have_http_status(200)
      expect(json_body['original_url']).to eq "https://example.com"
    end
  
    context "link is not found" do
      it "return an error" do
        get "/api/v1/links/NONEXISTENT"
        expect(response).to have_http_status(404)
        expect(json_body['error']).to eq "Not found"
      end
    end
  end
end
