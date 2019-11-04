require_relative '../http'

module Oncall
  module DSL
    class Call
      def initialize
        @config = Oncall::Core.config
        @http = Net::HTTP.new(@config.domain, @config.port)
        @headers = { 'User-Agent' => "oncall/#{Oncall::VERSION}" }
        @params = {}
      end

      def header(hash)
        hash.each do |key, value|
          @headers[key] = value
        end
      end

      def param(hash)
        hash.each do |key, value|
          @params[key] = value
        end
      end

      def get(path, &block)
        uri = Oncall::HTTP.uri(path, @params)
        request = Net::HTTP::Get.new(uri)

        @headers.each do |key, value|
          request[key] = value
        end

        response = @http.request(request)

        assertion = Oncall::DSL::Assertion.new(response, 'GET', path)
        assertion.instance_exec(&block)
      end

      def post(path, &block)
        uri = Oncall::HTTP.uri(path, @params)
        request = Net::HTTP::Post.new(uri)

        @headers.each do |key, value|
          request[key] = value
        end

        response = @http.request(request)

        assertion = Oncall::DSL::Assertion.new(response, 'POST', path)
        assertion.instance_exec(&block)
      end
    end
  end
end
