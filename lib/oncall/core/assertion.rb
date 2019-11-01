module Oncall
  module Core
    class Assertion
      def initialize(response)
        @reporter = Oncall::Core.reporter
        @response = response
      end

      def status(expected)
        result = @response.code == expected.to_s
        @reporter.report_status(result)
      end
    end
  end
end
