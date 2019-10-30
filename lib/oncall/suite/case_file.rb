require_relative '../dsl'

module Oncall
  class CaseFile
    def initialize(path)
      @path = path
      @dsl = Oncall::DSL.new
    end

    def run
      @dsl.instance_eval File.read(@path)
    end
  end
end
