module Oncall
  module Core
    class World

      attr_reader :suite

      def initialize
        @suite = []
      end

      def tests
        []
      end

      def register_suite(files)
        puts files
      end
    end
  end
end
