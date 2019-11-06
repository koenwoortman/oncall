require_relative '../core'

module Oncall
  module CLI
    class TestCommand
      def self.invoke(args)
        Oncall::Core::Runner.invoke(args)
      end
    end
  end
end
