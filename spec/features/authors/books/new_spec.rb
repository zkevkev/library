require 'rails_helper'

RSpec.describe 'authors books new page', type: :feature do
  before :each do
    @author1 = Author.create!(name: 'Agatha Christie', dead: true, sales: 2000000000)
    @author2 = Author.create!(name: 'William Shakespeare', dead: true, sales: 2000000000)
    @book1 = @author1.books.create!(name: 'Death on the Nile', new: false, publish_date: 1937)
    @book2 = @author2.books.create!(name: 'King Lear', new: true, publish_date: 1606)
  end

  it 'posts a new book beloning to the author when submitted' do
    visit "/parents/#{@author1.id}/child_table_name/new"

    fill_in 'name', with: 'Peril at End House'
    fill_in 'publish_date', with: '1932'
    page.choose('old')
    click_button 'Create Child'

    expect(page).to have_content('Peril at End House') 
    expect(page).to have_content('This copy is new: false') 
    expect(page).to have_content('Year published: 1932') 
  end
  
  it 'redirects to authors books index when form is completed' do
    visit "/parents/#{@author1.id}/child_table_name/new"

    fill_in 'name', with: 'Peril at End House'
    fill_in 'publish_date', with: '1932'
    page.choose('old')
    click_button 'Create Child'

    expect(assert_current_path("/parents/#{@author1.id}/child_table_name")).to be true
  end
end