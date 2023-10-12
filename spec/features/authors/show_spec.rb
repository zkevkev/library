require 'rails_helper'

RSpec.describe "authors show page", type: :feature do
  before :each do
    @author1 = Author.create!(name: 'Agatha Christie', dead: true, sales: 2000000000)
    @author2 = Author.create!(name: 'William Shakespeare', dead: true, sales: 2000000000)
    @book1 = @author1.books.create!(name: 'Death on the Nile', new: false, publish_date: 1937)
    @book2 = @author1.books.create!(name: 'Peril at End House', new: true, publish_date: 1932)
    @book3 = @author2.books.create!(name: 'King Lear', new: true, publish_date: 1606)
  end

  it 'shows the author with that id including their attributes' do
    visit "parents/#{@author1.id}"

    expect(page).to have_content(@author1.name)
    expect(page).to have_content("Author pushing daisies: #{@author1.dead}")
    expect(page).to have_content("Copies sold: #{@author1.sales}")
    expect(page).to have_content("Books in stock: #{@author1.books.size}")
  end

  it 'books button navigates to books index' do
    visit "/parents/#{@author1.id}"
    click_link "Books"
    
    expect(assert_current_path("/child_table_name")).to be true
  end

  it 'authors button navigates to authors index' do
    visit "/parents/#{@author1.id}"
    click_link "Authors"

    expect(assert_current_path("/parents")).to be true
  end
end