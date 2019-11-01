module Oncall
  module Core
    class Scenario
      def get(path, &block)
        assertion = Oncall::Core::Assertion.new
        assertion.instance_exec(&block)
      end
    end
  end
end
