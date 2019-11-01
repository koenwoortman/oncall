require_relative '../dsl'

module Oncall
  module Core
    class Wrapper
      def initialize(file)
        @file = file
      end

      def run(reporter)
        Oncall::DSL::Group.new.instance_eval File.read(@file)
      end
    end
  end
end
