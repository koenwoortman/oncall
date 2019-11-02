# frozen_string_literal: true

require_relative 'commands/base_command'
require_relative 'commands/init_command'
require_relative 'commands/run_command'
require_relative 'commands/shell_command'

module Oncall
  module CLI
    extend self

    def self.run
      case ARGV[0].to_s.downcase
      when 'init'
        Oncall::Commands::InitCommand.invoke(ARGV)
      when 'run'
        Oncall::Commands::RunCommand.invoke(ARGV)
      when 'shell'
        Oncall::Commands::ShellCommand.invoke(ARGV)
      else
        Oncall::Commands::BaseCommand.invoke(ARGV)
      end
    end
  end
end
