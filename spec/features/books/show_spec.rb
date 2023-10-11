require 'rails_helper'

RSpec.describe 'books show page', type: :feature do
  before :each do
    @author1 = Author.create!(name: 'Agatha Christie', dead: true, sales: 2000000000)
    @author2 = Author.create!(name: 'William Shakespeare', dead: true, sales: 2000000000)
    @book1 = @author1.books.create!(name: 'Death on the Nile', new: false, publish_date: 1937)
    @book2 = @author2.books.create!(name: 'King Lear', new: true, publish_date: 1606)
  end

  it 'shows a specific book attributes' do
    visit "/child_table_name/#{@book1.id}"

    expect(page).to have_content("#{@book1.name}")
    expect(page).to have_content("This copy is new: #{@book1.new}")
    expect(page).to have_content("Year published: #{@book1.publish_date}")
  end
end