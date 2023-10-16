require 'rails_helper'

RSpec.describe 'authors new page', type: :feature do
  it 'posts a new author to the authors table when submitted' do
    visit "/parents/new"

    fill_in 'name', with: 'Haruki Murakami'
    fill_in 'copies_sold', with: '100000000'
    page.choose('alive')
    click_button 'Create Author'

    expect(page).to have_content('Haruki Murakami') 
  end
  
  it 'redirects to authors index when form is completed' do
    visit "/parents/new"

    fill_in 'name', with: 'Haruki Murakami'
    fill_in 'copies_sold', with: '100000000'
    page.choose('alive')
    click_button 'Create Author'

    expect(assert_current_path("/parents")).to be true
  end
end