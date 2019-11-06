# frozen_string_literal: true

require_relative 'cli/base_command'
require_relative 'cli/init_command'
require_relative 'cli/run_command'
require_relative 'cli/shell_command'

module Oncall
  module CLI
    extend self

    def self.run
      case ARGV[0].to_s.downcase
      when 'init'
        Oncall::CLI::InitCommand.invoke(ARGV)
      when 'run'
        Oncall::CLI::RunCommand.invoke(ARGV)
      when 'shell'
        Oncall::CLI::ShellCommand.invoke(ARGV)
      else
        Oncall::CLI::BaseCommand.invoke(ARGV)
      end
    end
  end
end
