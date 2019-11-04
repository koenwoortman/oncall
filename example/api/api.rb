require 'sinatra'
require 'json'

get '/' do
  { foo: 'bar' }.to_json
end

post '/' do
  { foo: 'bar' }.to_json
end

get '/users' do
  { foo: 'bar' }.to_json
end

get '/users/1' do
  { foo: 'bar' }.to_json
end
