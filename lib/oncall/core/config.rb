module Oncall
  module Core
    class Config
      DEFAULT_PATTERN = '**{,/*/**}/*_oncall.rb'.freeze

      def initialize
        @config = []
        @env = 'develop'
      end

      def set_config(config)
        @config = config
      end

      def set_env(env)
        @env = env
      end

      def pattern
        DEFAULT_PATTERN
      end

      def failure_exit_code
        1
      end

      def domain
        @config[@env]['domain'] || 'localhost'
      end

      def port
        @config[@env]['port'] || 4567
      end

      def test_files
        Dir.glob(pattern)
      end
    end
  end
end
