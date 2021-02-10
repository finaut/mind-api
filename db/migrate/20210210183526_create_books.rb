class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.decimal :pages
      t.float :price

      t.references :author, index: true

      t.timestamps
    end
  end
end
