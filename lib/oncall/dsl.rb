module Oncall
  class DSL
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

    def to_s
      file
    end

    private

    def group(_name=nil, &block)
      return @reporter.empty_group(self) unless block_given?

      instance_exec &block
    end

    def get(path, &block)
      return @reporter.empty_call(self) unless block_given?

      uri = Oncall::HTTP.uri(path, @params)
      @request = Net::HTTP::Get.new(uri)

      @headers.each do |key, value|
        @request[key] = value
      end

      @response = @http.request(@request)

      instance_exec &block
    end

    def post(path, &block)
      return reporter.empty_call(self) unless block_given?

      uri = Oncall::HTTP.uri(path, @params)
      @request = Net::HTTP::Post.new(uri)

      @headers.each do |key, value|
        @request[key] = value
      end

      @response = @http.request(@request)

      instance_exec &block
    end

    def header(key_value)
      key_value.each do |key, value|
        @headers[key] = value
      end
    end

    def param(key_value)
      key_value.each do |key, value|
        @params[key] = value
      end
    end

    def validate(expected)
      result = JSON::Validator.validate(expected, @response.body)
      @reporter.json_schema(self, result, expected)
    end

    def status(expected)
      result = @response.code == expected.to_s
      @reporter.status(self, result, expected)
    end
  end
end
