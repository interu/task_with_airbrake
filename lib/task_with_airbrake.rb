require "task_with_airbrake/version"

module TaskWithAirbrake
  def self.task_with_logger_and_notify(*args, &block)
    new_block = proc {
      begin
        echo "[cron START] #{args.inspect} (#{Time.now})"

        yield if block_given?

        echo "[cron END] #{args.inspect} (#{Time.now})"
      rescue Exception => e
        echo "[cron ERROR] #{e} (#{Time.now})"
        e.backtrace.each { |l| echo l }
        HoptoadNotifier.notify(e)
        raise e
      ensure
        Rails.logger.flush
      end
    }
    task(*args, &new_block)
  end

  def echo(str)
    puts(Rails.logger.info(str))
    Rails.logger.flush
  end

end
