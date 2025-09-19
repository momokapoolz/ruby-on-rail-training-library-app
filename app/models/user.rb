class User < ApplicationRecord
  has_secure_password
  has_many :borrows
  has_many :histories

  validates :email, :role, presence: true
  validates :email, uniqueness: true
end
