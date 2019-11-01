describe do
  get '/404' do
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
