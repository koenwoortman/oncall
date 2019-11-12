module Oncall
  module Invocations
    class HelpRunner < BaseRunner
      attr_reader :parser

      def initialize(parser)
        @parser = parser
      end

      def run(_err, out)
        out.puts parser
      end
    end
  end
end
