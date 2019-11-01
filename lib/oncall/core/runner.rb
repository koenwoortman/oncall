module Oncall
  module Core
    class Runner
      def initialize(reporter=Oncall::Core.reporter, config=Oncall::Core.config, world=Oncall::Core.world)
        @config = config
        @world = world
        @reporter = reporter
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
        run_tests(@world.suite)
      end

      def setup(err, out)
        files = @config.test_files
        @world.register_suite(files)
      end

      def run_tests(suite)
        @reporter.report(suite) do |reporter|
          suite.map { |g| g.run(reporter) }
        end

        @reporter.success? ? 0 : @config.failure_exit_code
      end
    end
  end
end
