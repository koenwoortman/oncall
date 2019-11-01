module Oncall
  module DSL
    class Call
      def initialize
        @config = Oncall::Core.config
        @http = Net::HTTP.new(@config.domain, @config.port)
        @headers = { 'User-Agent' => "oncall/#{Oncall::VERSION}" }
      end

      def header(hash)
        hash.each do |key, value|
          @headers[key] = value
        end
      end

      def get(path, &block)
        request = Net::HTTP::Get.new(path)

        @headers.each do |key, value|
          request[key] = value
        end

        response = @http.request(request)

        assertion = Oncall::DSL::Assertion.new(response, 'GET', path)
        assertion.instance_exec(&block)
      end
    end
  end
end
