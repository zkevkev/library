require 'rails_helper'

RSpec.describe "authors edit page", type: :feature do
  before :each do
    @author1 = Author.create!(name: 'Agatha Christie', dead: true, sales: 2000000000)
    @author2 = Author.create!(name: 'William Shakespeare', dead: true, sales: 2000000000)
  end

  it 'updates the author record upon submission' do
    visit "/parents/#{@author2.id}"
    click_link "Update Author"
    fill_in "name", with: "Haruki Murakami"
    fill_in "copies_sold", with: "100000000"
    page.choose("alive")
    click_button "Submit"

    expect(page).to have_content("Haruki Murakami") 
    expect(page).to have_content("Author pushing daisies: false")
    expect(page).to have_content("Copies sold: 100000000")
  end

  it 'redirects to the author show page after updating' do
    visit "/parents/#{@author2.id}"
    click_link "Update Author"
    fill_in "name", with: "Haruki Murakami"
    fill_in "copies_sold", with: "100000000"
    page.choose("alive")
    click_button "Submit"

    expect(assert_current_path("/parents/#{@author2.id}")).to be true
  end
end