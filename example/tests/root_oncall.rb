Endpoint.define '/' do
  schema = {
    "type" => "object",
    "required" => ["foo"],
    "properties" => {
      "foo" => {"type" => "string"}
    }
  }

  get 'Should comply with JSON schema' do
    validate schema
  end
end
