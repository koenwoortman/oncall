module Oncall
  module Core
    require_relative 'core/config'
    require_relative 'core/reporter'
    require_relative 'core/runner'
    require_relative 'core/world'

    class << self
      attr_writer :config, :world
    end

    def self.config
      @config ||= Oncall::Core::Config.new
    end

    def self.world
      @world ||= Oncall::Core::World.new
    end
  end
end
