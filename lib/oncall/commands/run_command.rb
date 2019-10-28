module Oncall
  module Commands
    class RunCommand < BaseCommand
      def call
        runner = Oncall::Runner.new
        status = runner.run.to_i

        SUCCESS
      end
    end
  end
end
