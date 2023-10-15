class Author < ApplicationRecord
  has_many :books, dependent: :destroy

  def book_count
    self.books.count
  end
end