module Oncall
  class DSL
    def initialize(file, reporter)
      @reporter = reporter
      @file = file
      @http = nil
      @headers = {}
      @params = {}
    end

    def to_s
      @file
    end

    private

    def group(_name=nil, &block)
      return @reporter.empty_group(self) unless block_given?

      instance_exec &block
    end

    def get(path, &block)
      return @reporter.empty_call(self) unless block_given?

      @http = Oncall::HTTP.new(path, headers: @headers, params: @params)
      @http.get

      instance_exec &block
    end

    def post(path, &block)
      return reporter.empty_call(self) unless block_given?

      @http = Oncall::HTTP.new(path, headers: @headers, params: @params)
      @http.post

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
      result = JSON::Validator.validate(expected, @http.response_body)
      @reporter.json_schema(self, result, expected)
    end

    def status(expected)
      result = @http.response_code == expected.to_s
      @reporter.status(self, result, expected)
    end
  end
end
