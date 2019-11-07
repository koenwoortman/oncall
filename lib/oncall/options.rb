module Oncall
  class Options
    attr_accessor :runner,
                  :env,
                  :pattern,
                  :exclude,
                  :group,
                  :persist,
                  :config,
                  :path

    def initialize
      @runner = Oncall::Invocations::TestRunner.new
      @env = nil
      @pattern = nil
      @exclude = nil
      @group = nil
      @persist = nil
      @config = nil
      @path = nil
    end
  end
end
