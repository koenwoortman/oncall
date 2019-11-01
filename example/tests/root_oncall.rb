describe do
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
end
