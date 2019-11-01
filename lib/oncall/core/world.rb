module Oncall
  module Core
    class World

      attr_reader :suite

      def initialize
        @suite = []
      end

      def register_suite(files)
        files.each do |file|
          scenario = Oncall::Core::Scenario.new(file)
          @suite << scenario
        end
      end
    end
  end
end
