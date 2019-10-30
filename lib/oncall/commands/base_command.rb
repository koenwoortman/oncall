require_relative '../version'

module Oncall
  module Commands
    class BaseCommand

      SUCCESS = 0

      def initialize(args)
        @args = args
      end

      def self.invoke(args)
        OptionParser.new do |opts|
          opts.banner = 'Usage: oncall'
          opts.separator ''
          opts.separator 'Options:'

          opts.on('--version', 'Show version information.') do
            puts "oncall: version #{Oncall::VERSION}"
            exit
          end

          opts.on('--help', 'Display this help message.') do
            puts opts
            exit
          end

          puts opts
          exit
        end.parse!
      end
    end
  end
end
