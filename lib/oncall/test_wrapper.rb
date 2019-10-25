module Oncall
  class TestWrapper 
    def initialize
      @config = nil
    end

    def evaluate(file)
      test_case = Oncall::TestCase.new(@config)
      test_case.run(file)
    end

    def set_config(config)
      @config = config['develop']
    end
  end
end
