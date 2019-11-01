require_relative '../core'

module Oncall
  module Commands
    class RunCommand
      def self.invoke(args)
        Oncall::Core::Runner.invoke(args)
      end
    end
  end
end
