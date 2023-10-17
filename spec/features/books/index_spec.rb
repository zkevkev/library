require 'rails_helper'

RSpec.describe 'books index page', type: :feature do
  before :each do
    @author1 = Author.create!(name: 'Agatha Christie', dead: true, sales: 2000000000)
    @author2 = Author.create!(name: 'William Shakespeare', dead: true, sales: 2000000000)
    @book1 = @author1.books.create!(name: 'Death on the Nile', new: false, publish_date: 1937)
    @book2 = @author2.books.create!(name: 'King Lear', new: true, publish_date: 1606)
    @book3 = @author1.books.create!(name: 'Peril at End House', new: true, publish_date: 1932)
  end

  it 'shows an index of books, including their attributes, only if the book is new' do
    visit "/child_table_name"

    expect(page).to have_content("Books")
    expect(page).not_to have_content("#{@book1.name}")
    expect(page).not_to have_content("This copy is new: #{@book1.new}")
    expect(page).not_to have_content("Year published: #{@book1.publish_date}")
    expect(page).to have_content("#{@book2.name}")
    expect(page).to have_content("This copy is new: #{@book2.new}")
    expect(page).to have_content("Year published: #{@book2.publish_date}")
  end

  it 'authors link navigates to authors index' do
    visit "/child_table_name"
    click_link "Authors"

    expect(assert_current_path("/parents")).to be true
  end

  it 'update link next to books navigates to books edit form' do
    visit "/child_table_name"
    click_link "Update #{@book2.name}"
    
    expect(assert_current_path("/child_table_name/#{@book2.id}/edit")).to be true
  end

  it 'delete link deletes this record and refreshes' do
    visit "/child_table_name"
    click_button "Delete #{@book2.name}"

    expect(assert_current_path("/child_table_name")).to be true
    expect(page).not_to have_content(@book2.name)
  end

  it 'search bar searches for authors by name and returns only authors containing that name' do
    visit "/child_table_name"
    fill_in "search_by_name", with: "King Lear"
    click_button "Search"

    expect(page).to have_content(@book2.name)
    expect(page).not_to have_content(@book3.name)
  end
end
