module Oncall
  module Core
    class Wrapper
      def initialize(file)
        @file = file
      end

      def run(reporter)
        scenario = Oncall::Core::Scenario.new
        describe = scenario.instance_eval File.read(@file)

        if describe
          describe.call
        end
      end
    end
  end
end
