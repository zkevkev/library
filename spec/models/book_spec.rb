require 'rails_helper'

RSpec.describe Book, type: :model do
  before :each do
    @author1 = Author.create!(name: 'Agatha Christie', dead: true, sales: 2000000000)
    @author2 = Author.create!(name: 'William Shakespeare', dead: true, sales: 2000000000)
    @book1 = @author1.books.create!(name: 'Death on the Nile', new: false, publish_date: 1937)
    @book2 = @author2.books.create!(name: 'King Lear', new: true, publish_date: 1606)
  end
  
  it {should belong_to :author}
  
  describe "instance methods" do
    describe '#' do
      it '' do

      end
    end
  end
end