describe :root do
  get '/' do
    status 200

    # schema {
    #   'type' => 'object',
    #   'required' => ['foo'],
    #   'properties' => {
    #     'foo' => { 'type' => 'string' }
    #   }
    # }
  end
end
