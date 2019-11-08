module Oncall
  class DSL
    private
    def group(name=nil, &block)
      if block_given?
        instance_exec &block
      else
        puts 'nop'
      end
    end

    def get(path, &block)
      if block_given?
        instance_exec &block
      else
        puts 'nop'
      end
    end

    def post(path, &block); end

    def status(expected); end
  end
end
