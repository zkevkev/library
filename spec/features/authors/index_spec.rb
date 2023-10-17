require 'rails_helper'

RSpec.describe 'authors index page', type: :feature do
  before :each do
    @author1 = Author.create!(name: 'Agatha Christie', dead: true, sales: 2000000000)
    @author2 = Author.create!(name: 'William Shakespeare', dead: true, sales: 2000000000)
    @book1 = @author1.books.create!(name: 'Death on the Nile', new: false, publish_date: 1937)
    @book2 = @author1.books.create!(name: 'Peril at End House', new: true, publish_date: 1932)
    @book3 = @author2.books.create!(name: 'King Lear', new: true, publish_date: 1606)
  end
  
  it 'shows an index of author names and creation timestamps' do
    visit "/parents"

    expect(page).to have_content(@author1.name)
    expect(page).to have_content(@author1.created_at)
    expect(page).to have_content(@author2.name)
    expect(page).to have_content(@author2.created_at)
  end

  it 'shows author names ordered by recently created' do
    visit "/parents"
    
    expect(@author2.name).to appear_before(@author1.name)
  end

  it 'books link navigates to books index' do
    visit "/parents"
    click_link "Books"
    
    expect(assert_current_path("/child_table_name")).to be true
  end

  it 'new parent link navigates to new author record form' do
    visit "/parents"
    click_link "New Author"

    expect(assert_current_path("/parents/new")).to be true
  end

  it 'update link next to authors navigates to authors edit form' do
    visit "/parents"
    click_link "Update Agatha Christie"

    expect(assert_current_path("/parents/#{@author1.id}/edit")).to be true
  end

  it 'delete link deletes this record and refreshes' do
    visit "/parents"
    click_button "Delete #{@author1.name}"

    expect(assert_current_path("/parents")).to be true
    expect(page).not_to have_content(@author1.name)
  end

  xit 'sort by books sorts authors by the count of books in stock and shows the count' do
    visit "/parents"
    click_link "Sort by Number of Books"

    expect(assert_current_path("/parents?sort_by=count")).to be true
    expect(@author1.name).to appear_before(@author2.name)
    expect(page).to have_content("Books in stock for #{@author1.name}: 2")
    expect(page).to have_content("Books in stock for #{@author2.name}: 1")
  end
end