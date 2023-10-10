require 'rails_helper'

RSpec.describe Task, type: :model do
  before :each do
    @author1 = Author.create!(name: 'Agatha Christie', dead: true, sales: 2000000000)
    @author2 = Author.create!(name: 'William Shakespeare', dead: true, sales: 2000000000)
  end
  
  describe "instance methods" do
    describe '#index' do
      it 'displays an index of authors by name' do
        expect(@author1.index).to include(@author1.name)
        expect(@author2.index).to include(@author2.name)
      end
    end
  end
end