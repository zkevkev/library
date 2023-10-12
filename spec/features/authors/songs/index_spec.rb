require 'rails_helper'

RSpec.describe 'authors books index page', type: :feature do
  before :each do
    @author1 = Author.create!(name: 'Agatha Christie', dead: true, sales: 2000000000)
    @author2 = Author.create!(name: 'William Shakespeare', dead: true, sales: 2000000000)
    @book1 = @author1.books.create!(name: 'Death on the Nile', new: false, publish_date: 1937)
    @book2 = @author1.books.create!(name: 'Peril at End House', new: true, publish_date: 1932)
    @book3 = @author2.books.create!(name: 'King Lear', new: true, publish_date: 1606)
  end
  
  it 'shows all the books written by the author and their attributes' do
    visit "/parents/#{@author1.id}/child_table_name"

    expect(page).to have_content(@author1.name)
    expect(page).to have_content(@book1.name)
    expect(page).to have_content(@book1.new)
    expect(page).to have_content(@book1.publish_date)
    expect(page).to have_content(@book2.name)
    expect(page).to have_content(@book2.new)
    expect(page).to have_content(@book2.publish_date)
  end
end