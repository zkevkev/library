require 'rails_helper'

RSpec.describe 'authors index page', type: :feature do
  before :each do
    @author1 = Author.create!(name: 'Agatha Christie', dead: true, sales: 2000000000)
    @author2 = Author.create!(name: 'William Shakespeare', dead: true, sales: 2000000000)
  end
  
  it 'shows an index of author names' do
    visit "/parents"

    # refactor tests to use orderly
    # expect(this).to appear_before(that)
    expect(page).to have_content(@author1.name)
    expect(page).to have_content(@author1.created_at)
    expect(page).to have_content(@author2.name)
    expect(page).to have_content(@author2.created_at)
  end

  it 'books link navigates to books index' do
    visit "/parents"
    click_link "Books"
    
    expect(assert_current_path("/child_table_name")).to be true
  end

  it 'new parent link navigates to new parent record form' do
    visit "/parents"
    click_link "New Parent"

    expect(assert_current_path("/parents/new")).to be true
  end
end