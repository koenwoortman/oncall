module Oncall
  module Core
    class Runner
      def initialize(config=Oncall::Core.config, world=Oncall::Core.world)
        @config = config
        @world = world
      end

      def self.invoke(args)
        status = run(args, $stderr, $stdout).to_i
        exit(status) if status != 0
      end

      def self.run(args, err=$stderr, out=$stdout)
        # TODO: init options class
        new.run(err, out)
      end

      def run(err, out)
        setup(err, out)
        run_tests(@world.tests)
      end

      def setup(err, out)
        @config.load_test_files
      end

      def run_tests(tests)

        success = @config.reporter.report(tests) do |reporter|
          reporter
        end

        success ? 0 : @config.failure_exit_code
      end
    end
  end
end
