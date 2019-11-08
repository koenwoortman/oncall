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
      return reporter.empty_group(file) unless block_given?

      instance_exec &block
    end

    def get(path, &block)
      return reporter.empty_call(file, path) unless block_given?

      @request = Net::HTTP::Get.new(path)
      @response = http.request(request)

      instance_exec &block
    end

    def post(path, &block); end

    def status(expected)
      result = response.code == expected.to_s

      reporter.status(result)
    end
  end
end
