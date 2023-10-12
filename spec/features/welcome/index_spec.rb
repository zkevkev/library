require 'rails_helper'

RSpec.describe "welcome page", type: :feature do  
  it 'shows an index containing author and book categories' do
    visit "/"

    expect(page).to have_content("Authors Index")
    expect(page).to have_content("Books Index")
  end

  it 'authors link navigates to authors index' do
    visit "/"
    click_link "Authors Index"
    
    expect(assert_current_path("/parents")).to be true
  end

  it 'books link navigates to books index' do
    visit "/"
    click_link "Books Index"
    
    expect(assert_current_path("/child_table_name")).to be true
  end

  it 'books link navigates to books index' do
    visit "/"
    click_link "Books"
    
    expect(assert_current_path("/child_table_name")).to be true
  end

  it 'authors link navigates to authors index' do
    visit "/"
    click_link "Authors"

    expect(assert_current_path("/parents")).to be true
  end
end