Endpoint.get '/' do
  set_header 'Content-Type' => 'application/json'

  schema = {
    'type' => 'object',
    'required' => ['foo'],
    'properties' => {
      'foo' => { 'type' => 'string' }
    }
  }

  body 'should comply with JSON schema' do
    matches schema
  end

  status 'should be successful' do
    expect 200
  end

  profiler 'expect a response within a second' do
    respond_in 1.second
  end
end
