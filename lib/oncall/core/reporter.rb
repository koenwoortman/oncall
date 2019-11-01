module Oncall
  module Core
    class Reporter
      def initialize
        @results  = {
          failure: 0,
          success: 0,
          empty: 0
        }

        @messages = []
      end

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
        puts "\n\n"

        puts @messages

        puts "#{@results[:success]} passed, #{@results[:failure]} failed."
      end

      def success?
        @results[:failure].zero? && @results[:empty].zero?
      end

      def report_empty_group
        print 'E'
        @results[:empty] = @results[:empty] + 1
      end

      def report_status(result, message)
        if result
          print '.'
          @results[:success] = @results[:success] + 1
        else
          print 'F'
          @results[:failure] = @results[:failure] + 1
          @messages << message
        end
      end
    end
  end
end
