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

    def empty_group(file_name)
      puts 'Empty file'
    end

    def empty_call(path, file_name)
      puts 'Empty call in file'
    end

    def status(result)
      puts 'call with status'
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
