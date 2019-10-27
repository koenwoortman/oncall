module Oncall
  class Request
    def initialize(config, endpoint)
      @config = config
      @endpoint = endpoint
      @headers = {}
      @expectations = []
      @http = nil
      @response = nil
      @request = nil
    end

    def bootstrap
      @http = Net::HTTP.new(@config['domain'], @config['port'])

      @request = Net::HTTP::Get.new(@endpoint)

      @request['User-Agent'] = 'Oncall'

      @headers.each do |key, value|
        request[key] = value
      end

    end

    def run(&block)
      @response = @http.request(@request)

      instance_eval(&block)
    end

    private

    def header(header)
      @headers.merge!(header)
    end

    def body(description, &block)
      result = Oncall::BodyTest.new(@response.body, description).run(&block)
      puts "Endpoint: #{@endpoint} -----"
      puts "   Body: #{description}: #{result}"
    end

    def status(description, &block)
      @expectations.push(description)
    end

    def profiler(description, &block)
      @expectations.push(description)
    end
  end
end
