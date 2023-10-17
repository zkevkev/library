class AddBooksCountToAuthors < ActiveRecord::Migration[7.0]
  def change
    add_column :authors, :books_counter, :integer
  end
end
