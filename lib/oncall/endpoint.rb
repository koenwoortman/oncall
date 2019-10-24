module Oncall
  class Endpoint
    extend Oncall::DSL

    def initialize(route)
      @route = route
      @config = {
        'develop' => { 'domain' => 'localhost', 'port' => 4567 }
      }
    end

    def parse(filename)
      instance_eval File.read(filename)
    end

    def self.run(filename)
      Endpoint.new('').parse(filename)
    end

    def self.define(route, &block)
      new(route).instance_eval(&block)
    end

    def self.get(_description, &block)
      instance_eval(&block)
    end

    private

    def validate(schema)
      response = Net::HTTP.get_response(@config['develop']['domain'], @route, @config['develop']['port'])
      puts JSON::Validator.validate(schema, response.body)
    end
  end
end
