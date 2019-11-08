# frozen_string_literal: true

require 'net/http'
require 'yaml'
require 'optparse'
require 'json-schema'

# Oncall
module Oncall
  require_relative 'oncall/cli'
  require_relative 'oncall/dsl'
  require_relative 'oncall/options'
  require_relative 'oncall/invocations'
  require_relative 'oncall/test_file'
  require_relative 'oncall/reporter'
  require_relative 'oncall/version'

  class << self
    attr_writer :options
  end

  def self.options
    @options ||= Oncall::Options.new
  end
end
