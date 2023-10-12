require 'rails_helper'

RSpec.describe 'books show page', type: :feature do
  before :each do
    @author1 = Author.create!(name: 'Agatha Christie', dead: true, sales: 2000000000)
    @author2 = Author.create!(name: 'William Shakespeare', dead: true, sales: 2000000000)
    @book1 = @author1.books.create!(name: 'Death on the Nile', new: false, publish_date: 1937)
    @book2 = @author2.books.create!(name: 'King Lear', new: true, publish_date: 1606)
  end

  it 'updates the book record upon submission' do
    visit "/child_table_name/#{@book1.id}"
    click_link "Update Book"
    fill_in 'name', with: 'Peril at End House'
    fill_in 'publish_date', with: '1932'
    page.choose('old')
    click_button 'Submit'

    expect(page).to have_content('Peril at End House') 
    expect(page).to have_content("This copy is new: false")
    expect(page).to have_content("Year published: 1932")
  end

  it 'redirects to the book show page after updating' do
    visit "/child_table_name/#{@book1.id}"
    click_link "Update Book"
    fill_in 'name', with: 'Peril at End House'
    fill_in 'publish_date', with: '1932'
    page.choose('old')
    click_button 'Submit'

    expect(assert_current_path("/child_table_name/#{@book1.id}")).to be true
  end
end