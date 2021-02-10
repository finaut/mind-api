class Category < ApplicationRecord
  # associaty
  has_many :book_categories
  has_many :books, through: :book_categories
  # validates
  validates :name, presence: true, length: { in: 3..80}
end
