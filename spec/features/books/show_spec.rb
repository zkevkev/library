require 'rails_helper'

RSpec.describe 'books show page', type: :feature do
  before :each do
    @book1 = Book.create!(name: 'Death on the Nile', new: false, publish_date: 1937)
    @book2 = Book.create!(name: 'King Lear', new: true, publish_date: 1606)
  end

  it 'shows ' do
    visit "/child_table_name/#{@book1.id}"

    expect(page).to have_content("#{@book1.name}")
    expect(page).to have_content("This copy is new: #{@book1.new}")
    expect(page).to have_content("Year published: #{@book1.publish_date}")
  end
end