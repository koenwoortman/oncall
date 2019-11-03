require 'colorize'

module Oncall
  module Core
    class Reporter
      def initialize
        @results  = {
          failure: 0,
          success: 0,
          empty: 0
        }

        @start_time = nil
        @end_time = nil
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
        @start_time = Time.now
      end

      def finish
        @end_time = Time.now

        puts "\n\n"
        puts @messages

        elapsed_seconds = (@end_time.to_f - @start_time.to_f).to_f
        puts "Finished in #{elapsed_seconds.round(4)} seconds"

        result = "#{@results[:success]} passed, #{@results[:failure]} failed.\n"

        if success?
          puts result.green
        else
          puts result.red
        end
      end

      def success?
        @results[:failure].zero? && @results[:empty].zero?
      end

      def report_empty_group
        print '*'
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
