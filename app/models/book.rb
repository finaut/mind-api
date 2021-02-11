class Book < ApplicationRecord
  # association
  has_many :line_items
  has_many :book_categories
  has_many :categories, through: :book_categories
  belongs_to :author
  # validation
  validates :title, presence: true, uniqueness: true, length: { in: 3..50}
  validates :description, presence: true, length: { in: 50..1000}
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :pages, presence: true, length: {minimum: 1}, numericality: { only_integer: true}
  # hook
  before_destroy :ensure_not_referenced_by_any_line_item

  private
  def ensure_not_referenced_by_any_line_item
     if line_items.empty?
       return true
     else
       errors.add(:base, 'существуют товарные позиции')
       return false
     end
   end

end
