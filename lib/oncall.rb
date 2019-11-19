# frozen_string_literal: true

require 'net/http'
require 'yaml'
require 'optparse'
require 'json-schema'

# Oncall
module Oncall
  require_relative 'oncall/cli'
  require_relative 'oncall/dsl'
  require_relative 'oncall/http'
  require_relative 'oncall/options'
  require_relative 'oncall/invocations/base_runner'
  require_relative 'oncall/invocations/console_runner'
  require_relative 'oncall/invocations/help_runner'
  require_relative 'oncall/invocations/init_runner'
  require_relative 'oncall/invocations/test_runner'
  require_relative 'oncall/invocations/version_runner'
  require_relative 'oncall/reporter'
  require_relative 'oncall/scenario'
  require_relative 'oncall/version'

  class << self
    attr_writer :options
  end

  SCRIPT = 'oncall'

  def self.options
    @options ||= Oncall::Options.new
  end
end
