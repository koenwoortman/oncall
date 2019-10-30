require_relative '../suite'

module Oncall
  module Commands
    class RunCommand
      def self.invoke(args)
        # env = ARGV[0]
        # runner = Oncall::Runner.new(env)
        # exit runner.run.to_i
        suite = Oncall::Suite.new
        suite.collect
        suite.process
        suite.eval
      end
    end
  end
end
