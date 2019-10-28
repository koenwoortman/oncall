require_relative '../version'

module Oncall
  module Commands
    class BaseCommand

      SUCCESS = 0

      USAGE = <<~EOF
        Usage: oncall

        init          Initialize dotfiles directory
        run           Run test suite

        Options:
          --help      Display this help message
          --version   Show version information
      EOF

      def initialize
        @options = parse_options
      end

      def self.invoke
        exit new.call.to_i
      end

      def call
        case @options[0]
        when :version
          print_version
        else
          puts USAGE
        end

        SUCCESS
      end

      protected

      def print_version
        puts "oncall: version #{Oncall::VERSION}"
      end

      def parse_options
        options = []
        OptionParser.new do |opt|
          opt.on('--help') { options.push(:help) }
          opt.on('--version') { options.push(:version) }
        end.parse!

        options
      end
    end
  end
end
