module Oncall
  class Options
    attr_writer :runner
    attr_accessor :env,
                  :pattern,
                  :exclude,
                  :group,
                  :persist,
                  :config,
                  :path

    def initialize
      @runner = nil
      @env = nil
      @pattern = nil
      @exclude = nil
      @group = nil
      @persist = nil
      @config = nil
      @path = nil
    end

    def runner
      @runner ||= Oncall::Invocations::TestRunner.new
    end
  end
end
