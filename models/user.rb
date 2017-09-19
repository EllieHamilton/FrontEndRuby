require 'httparty'
require 'json'

# Class user
class User
  def self.all
    JSON.parse(HTTParty.get('http://localhost:9393/users').parsed_response)
  end

  def self.find(id)
    JSON.parse(HTTParty.get('http://localhost:9393/user/' + id).parsed_response)
  end
end
