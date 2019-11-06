module Oncall
  module Core
    class Config
      DEFAULT_PATTERN = '**{,/*/**}/*_oncall.rb'.freeze

      def initialize
        @config = {}
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
        if @config[@env]
          @config[@env]['domain']
        else
          'localhost'
        end
      end

      def port
        if @config[@env]
          @config[@env]['port']
        else
          4567
        end
      end

      def test_files
        Dir.glob(pattern)
      end
    end
  end
end
