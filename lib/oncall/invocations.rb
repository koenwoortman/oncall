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

    class TestRunner
      def run(err, out)
      end
    end

    class VersionRunner
      def run(err, out)
        out.puts "Oncall: v#{Oncall::VERSION}"
      end
    end
  end
end
