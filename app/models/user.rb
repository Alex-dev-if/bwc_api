class User < ApplicationRecord
  has_many :fines
  has_secure_password

  validates :email, presence: true, uniqueness: true
end
