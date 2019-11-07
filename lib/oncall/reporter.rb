module Oncall
  class Reporter
    def report
      start
      begin
        yield self
      ensure
        finish
      end
    end

    private

    def start
      @start_time = Time.now
    end

    def finish
      @end_time = Time.now
    end
  end
end
