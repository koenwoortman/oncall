# frozen_string_literal: true

require 'net/http'
require 'yaml'
require 'optparse'
require 'json-schema'

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
  module CLI
    extend self

    USAGE = <<-EOF
Usage: oncall

Options:
  --help      Display this help message
    EOF

    PATTERN = '**{,/*/**}/*_oncall.rb'

    def invoke
      options = parse_options

      if options[:help]
        print_usage
        exit 0
      end

      run_tests
    end

    private

    def parse_options
      options = {}
      OptionParser.new do |opt|
        opt.on('--help') { |o| options[:help] = o }
      end.parse!

      options
    end

    def print_usage
      puts USAGE
    end

    def run_tests
      begin
        config = YAML.load_file('oncall.yml')
      rescue
        puts 'Cannot load oncall.yml'
        exit 1
      end

      files = Dir.glob(PATTERN)

      process_files(files)
    end

    def process_files(files)
      files.each do |file|
        Endpoint.run(file)
      end
    end
  end
end
