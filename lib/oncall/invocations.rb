module Oncall
  module Invocations
    class ConsoleRunner
      def run(err, out); end
    end

    class HelpRunner
      attr_reader :parser

      def initialize(parser)
        @parser = parser
      end

      def run(err, out)
        out.puts parser
      end
    end

    class InitRunner
      def run(err, out)
        config_template_path = File.join(File.dirname(__FILE__), 'templates', 'oncall.yml.template')
        template = File.read(config_template_path)

        File.open(File.join(Dir.getwd, 'oncall.yml'), 'w') do |file|
          file.write(template)
        end
      end
    end

    class VersionRunner
      def run(err, out)
        out.puts "Oncall: v#{Oncall::VERSION}"
      end
    end

    class TestRunner
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
        files = []

        test_files.each do |file|
          test_file = Oncall::TestFile.new(file)
          files << test_file
        end

        files
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
