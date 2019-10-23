class Endpoint
  def initialize(route)
    @route = route
    @config = {
      'develop' => { 'domain' => 'localhost', 'port' => 4567 }
    }
  end

  def parse(filename)
    instance_eval File.read(filename)
  end

  def Endpoint.run(filename)
    Endpoint.new('').parse(filename)
  end

  def Endpoint.define(route, &block)
    new(route).instance_eval(&block)
  end

  private

  def get(description, &block)
    instance_eval(&block)
  end

  def validate(schema)
    response = Net::HTTP.get_response(@config['develop']['domain'], @route, @config['develop']['port'])
    puts JSON::Validator.validate(schema, response.body)
  end
end

module Oncall
  class Runner

    DEFAULT_PATTERN = '**{,/*/**}/*_oncall.rb'

    def initialize
      @pattern = DEFAULT_PATTERN
    end

    def run
      begin
        config = YAML.load_file('oncall.yml')
      rescue
        puts 'Cannot load oncall.yml'
        exit 1
      end

      files = Dir.glob(@pattern)

      process_files(files)
    end

    def process_files(files)
      files.each do |file|
        Endpoint.run(file)
      end
    end
  end
end
