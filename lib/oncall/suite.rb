require_relative 'suite/case_file'
require_relative 'suite/config'

module Oncall
  class Suite
    def initialize
      @files = []
      @cases = []
      @config = Oncall::Config.new
    end

    def collect
      @files = Dir.glob(@config.pattern)
    end

    def process
      @files.each do |file_path|
        @cases.push(Oncall::CaseFile.new(file_path))
      end
    end

    def eval
      @cases.each do |case_file|
        case_file.run
      end
    end
  end
end
