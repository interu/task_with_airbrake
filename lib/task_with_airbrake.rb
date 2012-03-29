require "task_with_airbrake/version"

module TaskWithAirbrake
  def self.execute_task(*args, &block)
    new_block = proc {
      begin
        self.echo "[CRON START] #{args.inspect} (#{Time.now})"

        yield if block_given?

        self.echo "[CRON END] #{args.inspect} (#{Time.now})"
      rescue Exception => e
        self.echo "[CRON ERROR] #{e} (#{Time.now})"
        e.backtrace.each { |l| self.echo l }
        Airbrake.notify(e)
        raise e
      ensure
        Rails.logger.flush
      end
    }
    task(*args, &new_block)
  end

  def self.echo(str)
    puts(Rails.logger.info(str))
    Rails.logger.flush
  end

end
