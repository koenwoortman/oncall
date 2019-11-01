module Oncall
  module Core
    class Request
      def initialize(&block)
        @proc = Proc.new &block
      end

      def call
        @proc.call
      end
    end
  end
end
