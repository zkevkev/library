require 'rails_helper'

RSpec.describe "authors edit page", type: :feature do
  before :each do
    @author1 = Author.create!(name: 'Agatha Christie', dead: true, sales: 2000000000)
    @author2 = Author.create!(name: 'William Shakespeare', dead: true, sales: 2000000000)
  end

  it '' do
     
  end
end