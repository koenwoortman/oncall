module Oncall
  class Request
    def initialize(endpoint)
      @endpoint = endpoint
      @headers = {}
      @expectations = []
    end

    def bootstrap(&block)
      instance_eval(&block)      
    end

    def run
      uri = URI.parse("http://localhost:4567#{@endpoint}")
      http = Net::HTTP.new(uri.host, uri.port)

      request = Net::HTTP::Get.new(uri.request_uri)

      request['User-Agent'] = 'Oncall'

      @headers.each do |key, value|
        request[key] = value
      end

      http.request(request)

      @expectations.each do |expectation|
        puts expectation
      end
    end

    private

    def header(header)
      @headers.merge!(header)
    end

    def body(description, &block)
      @expectations.push(description)
    end

    def status(description, &block)
      @expectations.push(description)
    end

    def profiler(description, &block)
      @expectations.push(description)
    end
  end
end
