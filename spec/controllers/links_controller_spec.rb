require 'rails_helper'

RSpec.describe LinksController, type: :controller do
  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new link and redirects" do
        expect {
          post :create, params: { link: { original_url: 'https://example.com' } }
        }.to change(Link, :count).by(1)
        expect(response).to redirect_to(shortened_path(Link.last.short_url))
      end
    end
  
    context "with invalid attributes" do
      it "does not create a link" do
        expect {
          post :create, params: { link: { original_url: '' } }
        }.not_to change(Link, :count)
      end
    end
  end
  
  describe "GET #unshort" do
    let(:link) { Link.create(original_url: 'https://example.com', short_url: 'abc123') }

    it "redirects to the original URL" do
      get :unshort, params: { short_url: link.short_url }
      expect(response).to redirect_to('https://example.com')
    end
      
    it "increments visit_count" do
      expect {
        get :unshort, params: { short_url: link.short_url }
      }.to change { link.reload.visit_count }.from(0).to(1)
    end
  end
end
  