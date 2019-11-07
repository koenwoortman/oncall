module Oncall
  class Options
    attr_accessor :runner

    def initialize
      @runner = Oncall::TestRunner.new
    end
  end
end
