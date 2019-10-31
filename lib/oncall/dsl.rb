require_relative 'dsl/response'

module Oncall
  class DSL
    private

    def describe(group, &block)
      if block_given?
        begin
          yield
        end
      else
        # Return status empty
      end
    end

    def get(path, &block)
      if block_given?
        http = Net::HTTP.new('localhost', 4567)
        request = Net::HTTP::Get.new(path)
        response = Oncall::Response.new(http.request(request))

        begin
          resuls = response.instance_eval &block
          resuls
        end
      else
        # Return status empty
      end
    end
  end
end
