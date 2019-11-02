group :user do
  header 'Content-Type' => 'application/json'

  schema = {
    'type' => 'object',
    'required' => ['foo'],
    'properties' => {
      'foo' => { 'type' => 'string' }
    }
  }

  param id: 1

  get '/users' do
    status 200
    validate schema
  end

  get '/users/:id' do
    status 200
    validate schema
  end
end
