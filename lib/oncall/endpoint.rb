module Oncall
  class Endpoint
    extend Oncall::DSL

    def initialize
    end

    def run(file)
      instance_eval File.read(file)
    end

    def self.get(endpoint, &block)
      domain = 'localhost'
      port = 4567
      @response = Net::HTTP.get_response(domain, endpoint, port)
      instance_eval(&block)
    end

    def self.header(header)
      puts header
    end

    def self.body(header, &block)
      puts header
      instance_eval(&block)
    end

    def self.status(header)
      puts header
    end

    def self.profiler(header)
      puts header
    end

    def self.matches(schema)
      result = JSON::Validator.validate(schema, @response.body)
    end
  end
end
