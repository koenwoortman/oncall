# frozen_string_literal: true
require 'net/http'
require 'yaml'

module Oncall
  module CLI
    def self.invoke

      begin
        config = YAML.load_file('oncall.yml')
      rescue
        puts 'Cannot load oncall.yml'
        exit(1)
      end

      path = ARGV[0]

      response = Net::HTTP.get_response(config['develop']['domain'], path, config['develop']['port'])
      puts response.body
    end
  end
end
