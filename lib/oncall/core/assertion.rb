module Oncall
  module Core
    class Assertion
      def initialize(response, method, path)
        @reporter = Oncall::Core.reporter
        @response = response
        @method = method
        @path = path
      end

      def status(expected)
        result = @response.code == expected.to_s

        message = """#{@method} #{@path}
expected: #{expected}
actual: #{@response.code}
        """

        @reporter.report_status(result, message)
      end
    end
  end
end
