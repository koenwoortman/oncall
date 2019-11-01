require 'logger'

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
        puts 'Reporter: start'
      end

      def finish
        puts 'Reporter: finish'
      end

      def report_status(result)
        puts result
      end
    end
  end
end
