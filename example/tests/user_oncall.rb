group do
  header 'Content-Type' => 'application/json'

  schema = {
    'type' => 'object',
    'required' => ['foo'],
    'properties' => {
      'foo' => { 'type' => 'string' }
    }
  }

  get '/users' do
    status 200
    validate schema
  end

  get '/users/:id' do
    status 200
    validate schema
  end
end
