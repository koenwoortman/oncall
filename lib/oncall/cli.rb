module Oncall
  # Manage the processing of command line options
  class CLI
    attr_reader :args, :options

    def initialize(args, options = Oncall.options)
      @args = args
      @options = options
    end

    def self.run(args)
      new(args).run
    end

    def run
      parse

      begin
        status = options.runner.run($stderr, $stdout)
      rescue Exception => e
        abort "#{Oncall::SCRIPT}: #{e.message}"
      end

      exit(status) if status.is_a? Integer
    end

    private

    def parse
      option_parser.parse!(args)
    rescue OptionParser::InvalidOption => e
      abort "#{Oncall::SCRIPT}: #{e.message}\nPlease use --help for a listing of valid options"
    rescue OptionParser::MissingArgument => e
      abort "#{Oncall::SCRIPT}: #{e.message}"
    end

    def option_parser
      OptionParser.new do |opt|
        opt.on('--env ENV', String, 'Specify the environment to test against') do |env|
          options.env= env
        end

        opt.on('--path PATH', String, 'Set the path for finding tests') do |path|
          options.path= path
        end

        opt.on('--pattern PATTERN', String, 'Load files matching pattern') do |pattern|
          options.pattern= pattern
        end

        opt.on('--exclude PATTERN', String, 'Exclude files matching pattern') do |pattern|
          options.exclude= pattern
        end

        opt.on('--group GROUP', String, 'Filter tests by group') do |group|
          options.group= group
        end

        opt.on('--persist PATH', String, 'Write output to a file instead of $stdout') do |path|
          options.persist= path
        end

        opt.on('--config PATH', String, 'Path to the config file') do |path|
          options.config= path
        end

        opt.on('--init', 'Initialize your project with Oncall') do
          options.runner= Oncall::Invocations::InitRunner.new
        end

        # This is for later
        # opt.on('--console', '') do
        #   options.runner= Oncall::Invocations::ConsoleRunner.new
        # end

        opt.on('--verbose', 'Increases the verbosity level for a more detailed output') do
          options.verbose= true
        end

        opt.on('--version', 'Display the version') do
          options.runner= Oncall::Invocations::VersionRunner.new
        end

        opt.on_tail('--help', 'This help message') do
          options.runner= Oncall::Invocations::HelpRunner.new(option_parser)
        end
      end
    end
  end
end
