module Oncall
  class Options
    attr_writer :runner
    attr_accessor :env,
                  :pattern,
                  :exclude,
                  :group,
                  :persist,
                  :config,
                  :path,
                  :verbose

    def initialize
      @env = default_env
      @pattern = default_pattern
      @exclude = ''
      @group = nil
      @persist = nil
      @config = nil
      @path = nil
      @verbose = verbosity_default
    end

    def runner
      @runner ||= Oncall::Invocations::TestRunner.new
    end

    private

    def default_pattern
      '**{,/*/**}/*_oncall.rb'
    end

    def default_env
      'develop'
    end

    def verbosity_default
      false
    end
  end
end
