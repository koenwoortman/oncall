describe do
  get '/' do
    status 200
    status 404

    # schema {
    #   'type' => 'object',
    #   'required' => ['foo'],
    #   'properties' => {
    #     'foo' => { 'type' => 'string' }
    #   }
    # }
  end
end
