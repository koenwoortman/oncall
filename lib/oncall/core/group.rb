module Oncall
  module Core
    class Group
      def describe(&block)
        if block_given?
          scenario = Oncall::Core::Scenario.new
          scenario.instance_exec &block
        else
          :empty
        end
      end
    end
  end
end
