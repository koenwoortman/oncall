module Oncall
  # Manage the processing of command line options
  class CLI
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
      abort 'Please use --help for a listing of valid options'
    end

    private

    def parser
      OptionParser.new do |opt|
        opt.on('--env', '') do
        end

        opt.on('--pattern', '') do
        end

        opt.on('--exclude', '') do
        end

        opt.on('--group', '') do
        end

        opt.on('--persist', '') do
        end

        opt.on('--config', '') do
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
