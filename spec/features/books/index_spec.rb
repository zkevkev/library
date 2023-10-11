require 'rails_helper'

RSpec.describe 'books index page', type: :feature do
  before :each do
    @book1 = Book.create!(name: 'Death on the Nile', new: false, publish_date: 1937)
    @book2 = Book.create!(name: 'King Lear', new: true, publish_date: 1606)
  end

  it 'shows an index of books, including their attributes' do
    visit "/child_table_name"

    expect(page).to have_content("#{@book1.name}")
    expect(page).to have_content("This copy is new: #{@book1.new}")
    expect(page).to have_content("Year published: #{@book1.publish_date}")
    expect(page).to have_content("#{@book2.name}")
    expect(page).to have_content("This copy is new: #{@book2.new}")
    expect(page).to have_content("Year published: #{@book2.publish_date}")
  end