# frozen_string_literal: true

module Oncall
  module CLI
    extend self

    USAGE = <<~EOF
      Usage: oncall

      Options:
        --help      Display this help message
    EOF

    def invoke
      options = parse_options

      if options[:help]
        print_usage
        exit 0
      end

      runner = Oncall::Runner.new
      status = runner.run.to_i
      exit(status)
    end

    private

    def parse_options
      options = {}
      OptionParser.new do |opt|
        opt.on('--help') { |o| options[:help] = o }
      end.parse!

      options
    end

    def print_usage
      puts USAGE
    end
  end
end
