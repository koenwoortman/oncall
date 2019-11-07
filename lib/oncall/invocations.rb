module Oncall
  module Invocations
    class ConsoleRunner
      def run(err, out); end
    end

    class HelpRunner
      def run(err, out); end
    end

    class InitRunner
      def run(err, out); end
    end

    class TestRunner
      def run(err, out); end
    end

    class VersionRunner
      def run(err, out)
        out.puts "Oncall: v#{Oncall::VERSION}"
      end
    end
  end
end
