# frozen_string_literal: true

module Oncall
  class Runner
    DEFAULT_PATTERN = '**{,/*/**}/*_oncall.rb'

    def initialize
      @config = {}
      @pattern = DEFAULT_PATTERN
      @test_wrapper = Oncall::TestWrapper.new
    end

    def run
      begin
        config = YAML.load_file('oncall.yml')
        merge_config(config)
      rescue StandardError
        puts 'Cannot load oncall.yml'
        exit 1
      end

      files = Dir.glob(@pattern)

      process_files(files)
    end

    def process_files(files)
      files.each do |file|
        @test_wrapper.evaluate(file)
      end
    end

    private

    def merge_config(config)
      @config = config
    end
  end
end
