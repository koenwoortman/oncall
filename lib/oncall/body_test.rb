module Oncall
  class BodyTest
    def initialize(body, description)
      @body = body
      @description = description
      @result = false
    end

    def run(&block)
      instance_eval(&block)
      @result
    end

    private

    def matches(schema)
      @result = JSON::Validator.validate(schema, @body)
    end
  end
end
