require 'rails_helper'

RSpec.describe Author, type: :model do
  before :each do
    @author1 = Author.create!(name: 'Agatha Christie', dead: true, sales: 2000000000)
    @author2 = Author.create!(name: 'William Shakespeare', dead: true, sales: 2000000000)
    @book1 = @author1.books.create!(name: 'Death on the Nile', new: false, publish_date: 1937)
    @book2 = @author1.books.create!(name: 'Peril at End House', new: true, publish_date: 1932)
    @book3 = @author2.books.create!(name: 'King Lear', new: true, publish_date: 1606)
  end
  
  it {should have_many :books}

  describe "instance methods" do
    describe '#book_count' do
      it 'returns a count of books written by the author' do
        expect(@author1.book_count).to eq(2)
        expect(@author2.book_count).to eq(1)
      end
    end

    describe '#threshold_sort' do
      it 'filters to return books published after the date input' do
        expect(@author1.threshold_sort(1935)).to eq([@book1])
        require 'pry'; binding.pry
      end
    end
  end
end