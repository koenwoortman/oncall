module Oncall
  module Invocations
    class TestRunner < BaseRunner
      def run(err, out)
        reporter.report do |r|
          suite.map { |g| g.run(r) }
        end

        reporter.success? ? 0 : 1
      end

      private

      def reporter
        @reporter ||= Oncall::Reporter.new
      end

      def suite
        suite = []

        test_files.each do |file|
          scenario = Oncall::Scenario.new(file)
          suite << scenario
        end

        suite
      end

      def test_files
        matched_files = Dir.glob(options.pattern)
        excluded_files = Dir.glob(options.exclude)
        matched_files - excluded_files
      end

      def options
        Oncall.options
      end
    end
  end
end
