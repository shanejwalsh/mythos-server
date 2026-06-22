class User < ApplicationRecord
  has_many :characters
  has_many :refresh_tokens, dependent: :destroy
  has_secure_password
  validates :username, presence: true
  validates :username, uniqueness: { case_sensitive: false }
end
