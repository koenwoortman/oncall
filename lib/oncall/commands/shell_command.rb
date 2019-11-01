require 'readline'

module Oncall
  module Commands
    class ShellCommand
      def self.invoke(args)
        while input = Readline.readline("> ", true)
          break     if input == "exit"

          # Remove blank lines from history
          Readline::HISTORY.pop if input == ""
          system(input)
        end
      end
    end
  end
end
