module Oncall
  module Core
    class Group
      def initialize
        @reporter = Oncall::Core.reporter
      end

      def describe(&block)
        if block_given?
          scenario = Oncall::Core::Scenario.new
          scenario.instance_exec &block
        else
          @reporter.report_empty_group
        end
      end
    end
  end
end
