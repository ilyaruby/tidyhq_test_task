require 'rails_helper'

RSpec.describe Link, type: :model do
  let(:link) { create :link, original_url: 'https://www.google.com/' }

  it 'sets #expires_at when created' do
    expect(link.expires_at).to be_within(1.hour).of(Time.now + 7.days)
  end

  it 'sets #short url' do
    expect(link.short_url).not_to be_empty
  end
end
