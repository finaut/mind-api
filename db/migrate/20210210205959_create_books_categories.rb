class CreateBooksCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :book_categories do |t|
      t.references :book, index: true
      t.references :category, index: true
    end
  end
end
