class Restaurant < ApplicationRecord
  validates :name, :address, :category, presence: true
  CATEGORIES = %w(chinese italian japanese french belgian)
  validates :category, inclusion: { in: CATEGORIES }
  has_many :reviews, dependent: :destroy
end
