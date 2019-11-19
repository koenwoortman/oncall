module Oncall
  class Scenario
    attr_reader :file_name

    def initialize(file_name)
      @file_name = file_name
    end

    def run(reporter)
      content = read_file_content(reporter)
      return unless content

      begin
        Oncall::DSL.new(self, reporter).instance_eval content
      rescue
        reporter.invalid_scenario(self)
      end
    end
    
    private

    def read_file_content(reporter)
      File.read(file_name)
    rescue
      reporter.unreadable_file(self)
    end
  end
end
