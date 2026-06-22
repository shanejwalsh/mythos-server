class RefreshToken < ApplicationRecord
  belongs_to :user

  before_create :generate_token

  scope :active, -> { where('expires_at > ?', Time.current) }

  private

  def generate_token
    self.token = SecureRandom.hex(32)
    self.expires_at = 30.days.from_now
  end
end
