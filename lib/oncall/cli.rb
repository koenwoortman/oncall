module Oncall
  # Manage the processing of command line options
  class CLI
    SCRIPT = 'oncall'

    attr_reader :args, :options

    def initialize(args, options=Oncall.options)
      @args = args
      @options = options
    end

    def self.run(args)
      new(args).run
    end

    def run
      parser.parse!(args)
      options.runner.run
    rescue OptionParser::InvalidOption => e
      abort "#{SCRIPT}: #{e.message}\nPlease use --help for a listing of valid options"
    rescue OptionParser::MissingArgument => e
      abort "#{SCRIPT}: #{e.message}"
    end

    private

    def parser
      OptionParser.new do |opt|
        opt.on('--env ENV', String) do |env|
          options.env= env
        end

        opt.on('--pattern PATTERN', String) do |pattern|
          options.pattern= pattern
        end

        opt.on('--exclude PATTERN', String) do |pattern|
          options.exclude= pattern
        end

        opt.on('--group GROUP', String) do |group|
          options.group= group
        end

        opt.on('--persist PATH', String) do |path|
          options.persist= path
        end

        opt.on('--config PATH', String) do |path|
          options.config= path
        end

        opt.on('--init', '') do
          options.runner= Oncall::Invocations::InitRunner.new
        end

        opt.on('--console', '') do
          options.runner= Oncall::Invocations::ConsoleRunner.new
        end

        opt.on('--version', '') do
          options.runner= Oncall::Invocations::VersionRunner.new
        end

        opt.on_tail('--help', 'This help message') do
          options.runner= Oncall::Invocations::HelpRunner.new
        end
      end
    end
  end
end
