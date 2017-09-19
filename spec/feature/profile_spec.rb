require 'capybara'
require 'capybara/rspec'

describe 'user profile' do
  it 'displays the user id and name on the profile page' do
    visit '/user/1'
    expect(page).to have_content 1
    expect(page).to have_content 'john smith'
  end
end
