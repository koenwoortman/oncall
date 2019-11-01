module Oncall
  module Core
    class Scenario
      def get(path, &block)
        http = Net::HTTP.new('localhost', 4567)
        request = Net::HTTP::Get.new(path)
        response = http.request(request)

        assertion = Oncall::Core::Assertion.new(response)
        assertion.instance_exec(&block)
      end
    end
  end
end
