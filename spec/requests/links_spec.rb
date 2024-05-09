require 'rails_helper'

RSpec.describe 'Links', type: :request do
  describe 'URL Shortening/Deshortening Process', type: :request do
    it 'shortens an URL and then redirects based on the shortened URL' do
      post links_path, params: { link: { original_url: 'https://example.com' } }
      link = Link.last
      get unshort_path(link.short_url)
      expect(response).to redirect_to('https://example.com')
    end
  end
end
