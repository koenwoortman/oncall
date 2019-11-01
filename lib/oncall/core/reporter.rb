require 'logger'

module Oncall
  module Core
    class Reporter

      def initialize(out)
        @logger = Logger.new(out)
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
        puts 'Reporter: start'
      end

      def finish
        puts 'Reporter: finish'
      end
    end
  end
end
