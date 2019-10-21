require 'sinatra'
require 'json'

get '/' do
  { foo: 'bar' }.to_json
end
