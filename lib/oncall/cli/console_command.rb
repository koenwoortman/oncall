require 'readline'

module Oncall
  module CLI
    class ConsoleCommand
      def self.invoke
        while input = Readline.readline("> ", true)
          break if input == "exit"

          # Remove blank lines from history
          Readline::HISTORY.pop if input == ""
          system(input)
        end
      end
    end
  end
end
