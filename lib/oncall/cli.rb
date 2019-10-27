# frozen_string_literal: true

require_relative 'commands/base_command'
require_relative 'commands/init_command'
require_relative 'commands/run_command'

module Oncall
  module CLI
    extend self

    def invoke
      case ARGV[0].to_s.downcase
      when 'init'
        Oncall::Commands::InitCommand.invoke
      when 'run'
        Oncall::Commands::RunCommand.invoke
      else
        Oncall::Commands::BaseCommand.invoke
      end
    end
  end
end
