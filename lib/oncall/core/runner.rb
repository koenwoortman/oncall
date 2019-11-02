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
        new.run(args, err, out)
      end

      def run(args, err, out)
        setup(args, err, out)
        run_tests(@world.suite)
      end

      def setup(args, err, out)
        begin
          config = YAML.load_file('oncall.yml')
        rescue StandardError
          puts 'Cannot load oncall.yml'
          exit 1
        end

        env = args[1] || config['default']

        @config.set_config(config)
        @config.set_env(env)

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
