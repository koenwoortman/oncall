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

        message = "#{@method} #{@path}\nexpected: #{expected}\nactual: #{@response.code}"

        @reporter.report_status(result, message)
      end
    end
  end
end
