module Oncall
  module DSL
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

      def validate(expected)
        result = JSON::Validator.validate(expected, @response.body)

        message = "#{@method} #{@path}\nexpected: #{expected}\nactual: #{@response.body}"

        @reporter.report_status(result, message)
      end
    end
  end
end
