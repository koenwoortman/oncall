module Oncall
  class Options
    attr_accessor :runner

    def initialize
      @runner = Oncall::Invocations::TestRunner.new
    end
  end
end
