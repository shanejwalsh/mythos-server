class User < ApplicationRecord
  has_many :characters
  has_secure_password
  validates :username, :password, presence: true
  validates :username, :uniqeness, { case_sensitive: false }
end

