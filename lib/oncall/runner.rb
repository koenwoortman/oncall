# frozen_string_literal: true

module Oncall
  class Runner
    DEFAULT_PATTERN = '**{,/*/**}/*_oncall.rb'

    def initialize(env)
      @config = {}
      @pattern = DEFAULT_PATTERN
      @test_wrapper = Oncall::TestWrapper.new
      @env = env
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
      0
    end

    def process_files(files)
      @test_wrapper.set_config(@config)

      files.each do |file|
        @test_wrapper.evaluate(file)
      end
    end

    private

    def merge_config(config)
      if config.key?(@env)
        @config = config[@env]
      elsif config.key?('default')
        @config = config[config['default']]
      else
        raise 'Config error'  
      end
    end
  end
end
