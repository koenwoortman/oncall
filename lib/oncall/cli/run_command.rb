require_relative '../core'

module Oncall
  module CLI
    class RunCommand
      def self.invoke
        Oncall::Core::Runner.invoke(Oncall::CLI.args)
      end
    end
  end
end
