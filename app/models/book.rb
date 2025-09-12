class Book < ApplicationRecord
  has_many :histories

  scope :available, -> { where("amount > 0") }
end
