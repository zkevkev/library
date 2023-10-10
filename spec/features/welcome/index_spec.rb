require 'rails_helper'

RSpec.describe "welcome page", type: :feature do  
  it 'shows an index containing author and book categories' do
    visit "/"

    expect(page).to have_content("Authors")
    expect(page).to have_content("Books")
  end
end