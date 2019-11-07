module Oncall
  class Options
    attr_accessor :runner,
                  :env,
                  :pattern,
                  :exclude,
                  :group,
                  :persist,
                  :config

    def initialize
      @runner = Oncall::Invocations::TestRunner.new
      @env = nil
      @pattern = nil
      @exclude = nil
      @group = nil
      @persist = nil
      @config = nil
    end
  end
end
