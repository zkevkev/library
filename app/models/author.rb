class Author < ApplicationRecord
  has_many :books, dependent: :destroy

  def book_count
    self.books.count
  end

  def threshold_sort(date)
    self.books.where("publish_date >= #{date}")
  end
end