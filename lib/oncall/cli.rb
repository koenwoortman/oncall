# frozen_string_literal: true
require 'net/http'
require 'yaml'
require 'optparse'

module Oncall
  module CLI
    extend self

    USAGE = <<-EOF
Usage: oncall

Options:
  --help      Display this help message
    EOF

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

      path = ARGV[0]

      response = Net::HTTP.get_response(config['develop']['domain'], path, config['develop']['port'])
      puts response.body
    end
  end
end
