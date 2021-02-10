class Author < ApplicationRecord
  # association
  has_many :books
  # validation
  validates :full_name, presence: true, length: { in: 6..80 }
end
