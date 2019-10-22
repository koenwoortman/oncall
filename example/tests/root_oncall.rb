Oncall.endpoint '/' do
  schema = {
    "type" => "object",
    "required" => ["foo"],
    "properties" => {
      "foo" => {"type" => "string"}
    }
  }

  get 'Should comply with JSON schema' do |response|
    response.validate schema
  end
end
