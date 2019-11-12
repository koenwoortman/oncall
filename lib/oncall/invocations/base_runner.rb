module Oncall
  module Invocations
    class BaseRunner
      def run(_err, _out)
        raise NotImplementedError
      end
    end
  end
end
