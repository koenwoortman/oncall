# frozen_string_literal: true

module Oncall
  class Runner
    DEFAULT_PATTERN = '**{,/*/**}/*_oncall.rb'

    def initialize
      @pattern = DEFAULT_PATTERN
    end

    def run
      begin
        YAML.load_file('oncall.yml')
      rescue StandardError
        puts 'Cannot load oncall.yml'
        exit 1
      end

      files = Dir.glob(@pattern)

      process_files(files)
    end

    def process_files(files)
      files.each do |file|
        Oncall::Endpoint.run(file)
      end
    end
  end
end
