module Oncall
  class TestCase
    def run(file)
      instance_eval File.read(file)
    end

    def get(endpoint, &block)
      Oncall::Request.new(endpoint)
    end
  end
end
