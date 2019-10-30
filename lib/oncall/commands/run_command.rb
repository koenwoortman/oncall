module Oncall
  module Commands
    class RunCommand
      def self.invoke(args)
        env = ARGV[0]
        runner = Oncall::Runner.new(env)
        exit runner.run.to_i
      end
    end
  end
end
