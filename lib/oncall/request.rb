module Oncall
  class Request
    def initialize(endpoint)
      @endpoint = endpoint
      @headers = {}
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

      response = http.request(request)
      puts response
    end

    private

    def header(header)
      @headers.merge!(header)
    end

    def body(description, &block)
      puts description
    end

    def status(description, &block)
      puts description 
    end

    def profiler(description, &block)
      puts description 
    end
  end
end
