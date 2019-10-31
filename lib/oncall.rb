# frozen_string_literal: true

require 'net/http'
require 'yaml'
require 'optparse'
require 'json-schema'

# Oncall
module Oncall
  require File.expand_path(File.join(File.dirname(__FILE__), 'oncall', 'cli'))
end
