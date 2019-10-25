module Oncall
  class TestWrapper 
    def evaluate(file)
      test_case = Oncall::TestCase.new
      test_case.run(file)
    end
  end
end
