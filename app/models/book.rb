class Book < ApplicationRecord
  belongs_to :author, counter_cache: :books_counter
end