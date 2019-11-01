module Oncall
  module Core
    class Assertion
      def status(expected)
        200 == expected
      end
    end
  end
end
