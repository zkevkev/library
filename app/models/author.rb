class Author < ApplicationRecord
  has_many :books, dependent: :destroy

  def book_count
    self.books.count
  end

  # maybe consider doing this as a class method?
  # def threshold_sort(date)
  #   books.where("publish_date >= #{date}")
  # end
end