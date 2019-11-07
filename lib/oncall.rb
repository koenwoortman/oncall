# frozen_string_literal: true

require 'net/http'
require 'yaml'
require 'optparse'
require 'json-schema'

# Oncall
module Oncall
  require_relative 'oncall/cli'

  require_relative 'oncall/options'

  require_relative 'oncall/runner'
  require_relative 'oncall/test_runner'

  class << self
    attr_writer :config, :world, :reporter, :options
  end

  def self.config
    @config ||= Oncall::Core::Config.new
  end

  def self.world
    @world ||= Oncall::Core::World.new
  end

  def self.reporter
    @reporter ||= Oncall::Core::Reporter.new
  end

  def self.options
    @options ||= Oncall::Options.new
  end
end
