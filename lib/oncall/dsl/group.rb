module Oncall
  module DSL
    class Group
      def initialize
        @reporter = Oncall::Core.reporter
      end

      def group(&block)
        if block_given?
          scenario = Oncall::DSL::Scenario.new
          scenario.instance_exec &block
        else
          @reporter.report_empty_group
        end
      end
    end
  end
end
