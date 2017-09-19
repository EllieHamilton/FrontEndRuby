require_relative '../../models/user'
require 'rspec'

describe User do
  describe '.all' do
    it 'returns a full list of users' do
      stub_request(:get, 'http://localhost:9393/users')
        .to_return(status: 200,
                   body: '[{"id":1,"forename":"john","surname":"smith"},
          {"id":2,"forename":"jane","surname":"doe"}]')
      expect(User.all).to eq [{
        'id' => 1, 'forename' => 'john', 'surname' => 'smith'
      }, {
        'id' => 2, 'forename' => 'jane', 'surname' => 'doe'
      }]
    end
  end

  describe '.find' do
    it 'returns a single user by id' do
      stub_request(:get, 'http://localhost:9393/user/1')
        .to_return(status: 200,
                   body: '{"id":1,"forename":"john","surname":"smith"}')
      expect(User.find('1')).to eq('id' => 1,
                                   'forename' => 'john',
                                   'surname' => 'smith')
    end
  end
end
