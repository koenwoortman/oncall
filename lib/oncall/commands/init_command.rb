module Oncall
  module Commands
    class InitCommand < BaseCommand
      def self.invoke
        puts ARGV
      end
    end
  end
end
