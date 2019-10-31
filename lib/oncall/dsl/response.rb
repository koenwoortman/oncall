module Oncall
  class Response
    def initialize(request)
      @request = request
    end

    private

    def status(code)
      if @request.code == code
        true
      else
        'failed'
      end
    end
  end
end
