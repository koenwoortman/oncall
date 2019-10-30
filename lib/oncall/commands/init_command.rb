module Oncall
  module Commands
    class InitCommand < BaseCommand
      def self.invoke(args)
        puts 'init'
        exit
      end
    end
  end
end
