module Oncall
  class TestFile
    attr_reader :file

    def initialize(file)
      @file = file
    end

    def run(reporter)
      Oncall::DSL.new(self, reporter).instance_eval File.read(file)
    end
  end
end
