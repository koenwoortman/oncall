module Oncall
  module Invocations
    class VersionRunner
      def run(err, out)
        out.puts "Oncall: v#{Oncall::VERSION}"
      end
    end
  end
end
