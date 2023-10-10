require 'rails_helper'

RSpec.describe "authors page", type: :feature do
  before :each do
    @author1 = Author.create!(name: 'Agatha Christie', dead: true, sales: 2000000000)
    @author2 = Author.create!(name: 'William Shakespeare', dead: true, sales: 2000000000)
  end
  
  it 'shows an index of author names' do
    visit "/parents"

    expect(page).to have_content(@author1.name)
    expect(page).to have_content(@author2.name)
  end
end