class User < ApplicationRecord
  has_many :characters
  has_many :refresh_tokens, dependent: :destroy
  has_secure_password
  validates :username, presence: true
  validates :username, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8 }, allow_nil: true

  def as_json(options = {})
    super(options.merge(except: [:password_digest]))
  end
end
