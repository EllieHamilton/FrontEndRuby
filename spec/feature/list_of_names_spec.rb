require 'capybara'
require 'capybara/rspec'
require 'spec_helper'

describe 'user index' do
  it 'displays an unordered list of users\' full names' do
    stub_request(:get, 'http://localhost:9393/users')
      .to_return(status: 200,
                 body: '[{"id":1,"forename":"john","surname":"smith"},
          {"id":2,"forename":"jane","surname":"doe"}]')

    visit '/'
    expect(page).to have_content 'john smith'
  end

  it 'links to the user profile page' do
    stub_request(:get, 'http://localhost:9393/users')
      .to_return(status: 200,
                 body: '[{"id":1,"forename":"john","surname":"smith"},
        {"id":2,"forename":"jane","surname":"doe"}]')

    visit '/'
    expect(page).to have_link('john smith', href: '/user/1')
  end
end
