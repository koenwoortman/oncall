module Oncall
  module Core
    class Scenario
      def initialize
        @config = Oncall::Core.config
        @http = Net::HTTP.new(@config.domain, @config.port)
      end

      def get(path, &block)
        request = Net::HTTP::Get.new(path)
        response = @http.request(request)

        assertion = Oncall::Core::Assertion.new(response)
        assertion.instance_exec(&block)
      end
    end
  end
end
