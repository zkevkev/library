require 'rails_helper'

RSpec.describe 'authors books index page', type: :feature do
  before :each do
    @author1 = Author.create!(name: 'Agatha Christie', dead: true, sales: 2000000000)
    @book1 = @author1.books.create!(name: 'Death on the Nile', new: false, publish_date: 1937)
    @book2 = @author1.books.create!(name: 'Peril at End House', new: true, publish_date: 1932)
  end

  it '' do
    
  end
end