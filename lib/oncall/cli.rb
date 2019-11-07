require_relative 'cli/base_command'
require_relative 'cli/console_command'
require_relative 'cli/init_command'
require_relative 'cli/run_command'

module Oncall
  # Manage the processing of command line options
  module CLI
    class << self
    end

    def self.run
      case args.first
      when 'console'
        Oncall::CLI::ConsoleCommand.invoke
      when 'init'
        Oncall::CLI::InitCommand.invoke
      when 'run'
        Oncall::CLI::RunCommand.invoke
      else
        Oncall::CLI::BaseCommand.invoke
      end
    end

    def self.args
      @args ||= ARGV
    end
  end
end
