class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def add_book(book_id)
    current_item = line_items.find_by(book_id: book_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(book_id: book_id)
    end
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price}
  end
end
