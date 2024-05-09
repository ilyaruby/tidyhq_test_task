class Link < ApplicationRecord
  validates :original_url, presence: true, url: true  # Ensure you add a URL validator gem or custom validation
  validates :short_url, presence: true, uniqueness: true

  before_validation :generate_short_url, on: :create
  before_create :set_expiration_date

  def expired?
    expires_at < Time.current
  end

  private

  def generate_short_url
    self.short_url = SecureRandom.alphanumeric(10)
  end

  def set_expiration_date
    self.expires_at = 7.days.from_now
  end
end
