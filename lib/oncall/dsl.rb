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
        response = Oncall::Response.new
        begin
          resuls = response.instance_eval &block
          puts resuls
        end
      else
        # Return status empty
      end
    end
  end
end
