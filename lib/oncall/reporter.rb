require 'colorize'

module Oncall
  class Reporter
    attr_accessor :results

    def initialize
      @start_time = nil
      @end_time = nil
      @results = {
        success: 0,
        failed: 0,
        warn: 0,
        skipped: 0
      }
    end

    def report
      start
      begin
        yield self
      ensure
        finish
      end
    end

    def empty_group(test_case)
      add_warn
      report_empty_group
    end

    def empty_call(test_case)
      add_skipped
      report_empty_call
    end

    def status(test_case, result)
      if result
        add_success
        report_success
      else
        add_failed
        report_failure
      end
    end

    def success?
      @results[:failed].zero?
    end

    private

    def add_success
      @results[:success] = @results[:success] + 1
    end

    def add_failed
      @results[:failed] = @results[:failed] + 1
    end

    def add_warn
      @results[:warn] = @results[:warn] + 1
    end

    def add_skipped
      @results[:skipped] = @results[:skipped] + 1
    end

    def report_success
      puts '.'
    end

    def report_failure
      puts 'F'
    end

    def report_empty_group
      puts 'W'
    end

    def report_empty_call
      puts '*'
    end

    def start
      @start_time = Time.now
    end

    def finish
      @end_time = Time.now

      puts "\n\n"

      elapsed_seconds = (@end_time.to_f - @start_time.to_f).to_f
      puts "Finished in #{elapsed_seconds.round(4)} seconds"

      result = "#{@results[:success]} passed.\n#{@results[:failed]} failed.\n#{@results[:warn]} warnings.\n#{@results[:skipped]} skipped.\n"

      if success?
        puts result.green
      else
        puts result.red
      end
    end
  end
end
