module Oncall
  module Commands
    class RunCommand < BaseCommand
      def call
        env = ARGV[1]
        runner = Oncall::Runner.new(env)
        status = runner.run.to_i

        SUCCESS
      end
    end
  end
end
