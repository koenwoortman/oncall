module Oncall
  module Invocations
    class VersionRunner < BaseRunner
      def run(_err, out)
        out.puts "#{Oncall::SCRIPT}: v#{Oncall::VERSION}"
      end
    end
  end
end
