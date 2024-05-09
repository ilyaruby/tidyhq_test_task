require 'rails_helper'

RSpec.describe Link, type: :model do
  let(:link) { create :link, original_url: 'https://www.google.com/' }

  it 'sets #expires_at when created' do
    expect(link.expires_at).to be_within(1.hour).of(Time.now + 7.days)
  end

  it 'sets #short url' do
    expect(link.short_url).not_to be_empty
  end
  
  context 'validation' do
    let(:link) { build :link, original_url: '' }

    it 'validates presence of original_url' do
      expect(link).not_to be_valid
    end
  end

  context 'analytics' do
    it 'increments #visit_count' do
      expect {
        link.visited
      }.to change(link, :visit_count).from(0).to(1)
    end
  end
end
