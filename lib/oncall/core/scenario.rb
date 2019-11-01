module Oncall
  module Core
    class Scenario
      def describe(&block)
        if block_given?
          Proc.new &block
        else
          :empty
        end
      end

      def get(path, &block)
        puts path
      end
    end
  end
end
