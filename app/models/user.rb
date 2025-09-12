class User < ApplicationRecord
  has_many :borrows
  has_many :histories

  validates :email, :password, :role, presence: true
end
