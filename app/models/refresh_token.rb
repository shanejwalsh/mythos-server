require 'digest'

class RefreshToken < ApplicationRecord
  belongs_to :user

  # The raw token is only available on the instance that created it; the DB
  # stores a SHA-256 hash, so a database leak doesn't expose usable tokens.
  attr_reader :raw_token

  before_create :generate_token

  scope :active,  -> { where('expires_at > ?', Time.current) }
  scope :expired, -> { where('expires_at <= ?', Time.current) }

  def self.digest(raw)
    Digest::SHA256.hexdigest(raw.to_s)
  end

  # Find a non-expired token by its raw (unhashed) value.
  def self.find_active(raw)
    return if raw.blank?
    active.find_by(token: digest(raw))
  end

  private

  def generate_token
    @raw_token = SecureRandom.hex(32)
    self.token = self.class.digest(@raw_token)
    self.expires_at = 30.days.from_now
  end
end
