require 'rails_helper'

RSpec.describe 'authors new page', type: :feature do
  it 'does stuff' do
    visit "/parents/new"
    within("#session") do
      fill_in 'name', with: 'Haruki Murakami'
      fill_in 'copies sold', with: '100000000'
      page.check('alive')
    end
    click_button 'Create Parent'

    expect(assert_current_path("/parents")).to be true
  end
end