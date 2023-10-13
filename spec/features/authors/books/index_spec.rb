require 'rails_helper'

RSpec.describe 'authors books index page', type: :feature do
  before :each do
    @author1 = Author.create!(name: 'Agatha Christie', dead: true, sales: 2000000000)
    @author2 = Author.create!(name: 'William Shakespeare', dead: true, sales: 2000000000)
    @book1 = @author1.books.create!(name: 'Death on the Nile', new: false, publish_date: 1937)
    @book2 = @author1.books.create!(name: 'Peril at End House', new: true, publish_date: 1932)
    @book3 = @author2.books.create!(name: 'King Lear', new: true, publish_date: 1606)
  end
  
  it 'shows all the books written by the author and their attributes' do
    visit "/parents/#{@author1.id}/child_table_name"

    expect(page).to have_content(@author1.name)
    expect(page).to have_content(@book1.name)
    expect(page).to have_content(@book1.new)
    expect(page).to have_content(@book1.publish_date)
    expect(page).to have_content(@book2.name)
    expect(page).to have_content(@book2.new)
    expect(page).to have_content(@book2.publish_date)
  end

  it 'books link navigates to books index' do
    visit "/parents/#{@author1.id}/child_table_name"
    click_link "Books"
    
    expect(assert_current_path("/child_table_name")).to be true
  end

  it 'authors link navigates to authors index' do
    visit "/parents/#{@author1.id}/child_table_name"
    click_link "Authors"

    expect(assert_current_path("/parents")).to be true
  end

  it 'add book link navigates to new book page' do
    visit "/parents/#{@author1.id}/child_table_name"
    click_link "Add Book"

    expect(assert_current_path("/parents/#{@author1.id}/child_table_name/new")).to be true
  end

  it 'sorts alphabetically by name when sort books link is clicked' do
    visit "/parents/#{@author1.id}/child_table_name"
    click_link "Sort Books"

    expect(@book1.name).to appear_before(@book2.name)
    expect(assert_current_path("/parents/#{@author1.id}/child_table_name?sort=name")).to be true
  end

  it 'only shows books published after date input in threshold sort' do
    visit "/parents/#{@author1.id}/child_table_name"
    fill_in "threshold", with: "1935"
    click_button "Submit"

    expect(page).to have_content(@book1.name)
    expect(page).not_to have_content(@book2.name)
  end

  it 'delete link deletes this record and refreshes' do
    visit "/parents/#{@author1.id}/child_table_name"
    click_button "Delete #{@book1.name}"

    expect(assert_current_path("/child_table_name")).to be true
    expect(page).not_to have_content(@book1.name)
  end
end