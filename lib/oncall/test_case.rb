module Oncall
  class TestCase

    def initialize(config)
      @config = config
    end

    def run(file)
      instance_eval File.read(file)
    end

    def get(endpoint, &block)
      test = Oncall::Request.new(@config, endpoint)
      test.bootstrap(&block)
      test.run
    end

    def post(endpoint, &block)
      test = Oncall::Request.new(@config, endpoint)
      test.bootstrap(&block)
      test.run
    end
  end
end
