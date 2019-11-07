module Oncall
  class World

    attr_reader :suite

    def initialize
      @suite = []
    end

    def register_suite(files)
      files.each do |file|
        wrapper = Oncall::Core::Wrapper.new(file)
        @suite << wrapper
      end
    end
  end
end
