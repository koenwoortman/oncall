group do
  header 'Content-Type' => 'application/json'

  get '/' do
    schema = {
      'type' => 'object',
      'required' => ['foo'],
      'properties' => {
        'foo' => { 'type' => 'string' }
      }
    }

    status 200
    validate schema
  end

  post '/' do
    status 200
  end
end
