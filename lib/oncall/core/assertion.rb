module Oncall
  module Core
    class Assertion
      def initialize
        @reporter = Oncall::Core.reporter
      end

      def status(expected)
        result = 200 == expected
        @reporter.report_status(result)
      end
    end
  end
end
