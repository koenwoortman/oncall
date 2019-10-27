module Oncall
  class Request
    def initialize(config, endpoint)
      @config = config
      @endpoint = endpoint
      @headers = {}
      @expectations = []
    end

    def bootstrap(&block)
      instance_eval(&block)      
    end

    def run
      http = Net::HTTP.new(@config['domain'], @config['port'])

      request = Net::HTTP::Get.new(@endpoint)

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
      @expectations.push(Oncall::BodyTest.new({}, description).run(&block))
    end

    def status(description, &block)
      @expectations.push(description)
    end

    def profiler(description, &block)
      @expectations.push(description)
    end
  end
end
