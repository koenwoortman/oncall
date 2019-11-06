# frozen_string_literal: true

require_relative 'cli/base_command'
require_relative 'cli/console_command'
require_relative 'cli/init_command'
require_relative 'cli/run_command'

module Oncall
  module CLI
    extend self

    def self.run
      case ARGV[0].to_s.downcase
      when 'console'
        Oncall::CLI::ConsoleCommand.invoke(ARGV)
      when 'init'
        Oncall::CLI::InitCommand.invoke(ARGV)
      when 'run'
        Oncall::CLI::RunCommand.invoke(ARGV)
      else
        Oncall::CLI::BaseCommand.invoke(ARGV)
      end
    end
  end
end
