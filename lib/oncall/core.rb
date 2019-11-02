module Oncall
  module Core
    require_relative 'core/config'
    require_relative 'core/reporter'
    require_relative 'core/runner'
    require_relative 'core/world'
    require_relative 'core/wrapper'

    STATUS_EMPTY = :empty

    class << self
      attr_writer :config, :world, :reporter
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
  end
end
