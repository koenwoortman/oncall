get '/' do
  header 'Content-Type' => 'application/json'

  body 'should comply with JSON schema' do
    schema = {
      'type' => 'object',
      'required' => ['foo'],
      'properties' => {
        'foo' => { 'type' => 'string' }
      }
    }

    matches schema
  end

  status 'should be successful' do
    expect 200
  end

  profiler 'expect a response within a second' do
    respond_in 1.second
  end
end
