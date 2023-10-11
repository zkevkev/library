require 'rails_helper'

RSpec.describe Author, type: :model do
  before :each do
    @author1 = Author.create!(name: 'Agatha Christie', dead: true, sales: 2000000000)
    @author2 = Author.create!(name: 'William Shakespeare', dead: true, sales: 2000000000)
  end
  
  it {should have_many :books}

  describe "instance methods" do
    describe '#' do
      it '' do

      end
    end
  end
end