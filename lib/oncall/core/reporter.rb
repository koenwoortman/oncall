module Oncall
  module Core
    class Reporter
      def report(tests)
        start
        begin
          yield self
        ensure
          finish
        end
      end

      def start
      end

      def finish
      end
    end
  end
end
