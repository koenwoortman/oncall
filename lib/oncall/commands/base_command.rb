module Oncall
  module Commands

    class BaseCommand
      USAGE = <<~EOF
        Usage: oncall

        Options:
          --help      Display this help message
      EOF

      def self.invoke
        puts USAGE
        exit 0
      end
    end
  end
end
