module Oncall
  module Commands
    class RunCommand < BaseCommand
      def self.invoke
        options = parse_options

        if options[:help]
          print_usage
          exit 0
        end

        runner = Oncall::Runner.new
        status = runner.run.to_i
        exit(status)
      end

      def self.parse_options
        options = {}
        OptionParser.new do |opt|
          opt.on('--help') { |o| options[:help] = o }
        end.parse!

        options
      end
    end
  end
end
