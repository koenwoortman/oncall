module Oncall
  class DSL
    private

    attr_accessor :response, :request
    attr_reader :reporter, :file, :http

    public

    def initialize(file, reporter)
      @reporter = reporter
      @file = file
      @http = Net::HTTP.new('localhost', 4567)
      @headers = { 'User-Agent' => "oncall/#{Oncall::VERSION}" }
      @params = {}
      @query = {}
      @response = nil
      @request = nil
    end

    private

    def group(name=nil, &block)
      return reporter.empty_group(self) unless block_given?

      instance_exec &block
    end

    def get(path, &block)
      return reporter.empty_call(self) unless block_given?

      @request = Net::HTTP::Get.new(path)
      @response = http.request(request)

      instance_exec &block
    end

    def post(path, &block); end

    def header(key_value); end

    def param(key_value); end

    def validate(expected)
      result = JSON::Validator.validate(expected, @response.body)
      reporter.json_schema(self, result, expected)
    end

    def status(expected)
      result = response.code == expected.to_s
      reporter.status(self, result, expected)
    end
  end
end
