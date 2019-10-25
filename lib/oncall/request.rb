module Oncall
  class Request
    def initialize(endpoint)
      @endpoint = endpoint
    end

    def bootstrap(&block)
      instance_eval(&block)      
    end

    def run; end

    private

    def header(header)
      puts header
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
