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
        puts ''
      end

      def report_status(result)
        if result
          print '.'
        else
          print 'F'
        end
      end
    end
  end
end
