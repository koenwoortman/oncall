module Oncall
  module Commands
    class InitCommand < BaseCommand
      def call
        puts ARGV

        SUCCESS
      end
    end
  end
end
