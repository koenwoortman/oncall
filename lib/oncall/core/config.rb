module Oncall
  module Core
    class Config
      DEFAULT_PATTERN = '**{,/*/**}/*_oncall.rb'.freeze

      def initialize
        @files = []
      end

      def pattern
        DEFAULT_PATTERN
      end

      def failure_exit_code
        1
      end

      def domain
        'localhost'
      end

      def port
        4567
      end

      def test_files
        Dir.glob(pattern)
      end
    end
  end
end
