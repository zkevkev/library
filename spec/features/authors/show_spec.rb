require 'rails_helper'

RSpec.describe "authors show page", type: :feature do
  before :each do
    @author1 = Author.create!(name: 'Agatha Christie', dead: true, sales: 2000000000)
    @author2 = Author.create!(name: 'William Shakespeare', dead: true, sales: 2000000000)
  end

  it 'shows the author with that id including their attributes' do
    visit "parents/#{@author1.id}"

    expect(page).to have_content(@author1.name)
    expect(page).to have_content("Author pushing daisies: #{@author1.dead}")
    expect(page).to have_content("Copies Sold: #{@author1.sales}")

  end
end