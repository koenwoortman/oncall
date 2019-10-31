require_relative '../suite'

module Oncall
  module Commands
    class RunCommand
      def self.invoke(args)
        suite = Oncall::Suite.new
        suite.collect
        suite.process
        suite.eval
      end
    end
  end
end
