# frozen_string_literal: true

require 'net/http'
require 'yaml'
require 'optparse'
require 'json-schema'

# Oncall
module Oncall
  require File.expand_path(File.join(File.dirname(__FILE__), 'oncall', 'cli'))
  require File.expand_path(File.join(File.dirname(__FILE__), 'oncall', 'dsl'))
  require File.expand_path(File.join(File.dirname(__FILE__), 'oncall', 'endpoint'))
  require File.expand_path(File.join(File.dirname(__FILE__), 'oncall', 'version'))
  require File.expand_path(File.join(File.dirname(__FILE__), 'oncall', 'runner'))
end
