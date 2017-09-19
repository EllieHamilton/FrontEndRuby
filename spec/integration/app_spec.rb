ENV['RACK_ENV'] = 'test'

require_relative '../../my_app.rb'
require 'rack/test'
require 'rspec'

describe 'MyApp' do
  include Rack::Test::Methods

  def app
    MyApp
  end

  it 'has a valid route to index' do
    stub_request(:get, 'http://localhost:9393/users')
      .to_return(status: 200,
                 body: '[{"id":1,"forename":"john","surname":"smith"},
          {"id":2,"forename":"jane","surname":"doe"}]')

    get '/'
    expect(last_response.status).to eq 200
  end

  it 'has a valid route to profile' do
    stub_request(:get, 'http://localhost:9393/user/1')
      .to_return(status: 200,
                 body: '{"id":1,"forename":"john","surname":"smith"}')

    get '/user/1'
    expect(last_response.status).to eq 200
  end
end

describe 'health check' do
  include Rack::Test::Methods

  def app
    MyApp
  end

  it 'has a valid route' do
    get '/ping'
    expect(last_response.status).to eq 200
  end

  it 'returns pong' do
    get '/ping'
    expect(last_response.body).to eq 'pong'
  end
end
