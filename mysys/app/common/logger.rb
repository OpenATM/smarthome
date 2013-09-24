require 'logger.rb'

# See  configure
class MppLogger
  # Configures Logger's datatime_format
  def self.configure(logger)
    logger.datetime_format = "%Y-%m-%d %H:%M:%S"
    logger
  end
end

# Logger proxy that manages switching between different logger levels. Defaults to stdout logger.
#
# Later on users can set new loggers with add_logger. All added loggers should be closed with close (for individual) or closeAll.
#
#     logger = LoggerAdapter.new.init_first_logger
#     ...
#     logger.add_logger(my_logger)
#     begin
#         ...
#     ensure
#        logger.closeAll        
#     end
class LoggerAdapter
  attr_accessor :logger

  def stdout
    MppLogger.configure(Logger.new($stdout))
  end

  def init_first_logger(logger=nil)
    @list=[]
    @logger = stdout()
    add_logger(logger) if logger
    if defined? yield
      begin
        yield(self)
      ensure
        closeAll
      end
    end
  end

  def add_logger(logger)
    @list << logger
    @logger = logger
    logger
  end

  def debug(msg)
    @logger.debug msg
  end

  def info(msg)
    @logger.info msg
  end

  def warn(msg)
    @logger.warn msg
  end

  def error(msg)
    @logger.error msg
  end

  def closeAll
    @list.each do |logger|
      logger.close
    end
    @list.clear
  end

  def close
    @logger.close
    if @list.size > 0
      @logger = @list.delete_at(-1)
    else
      @logger = stdout
    end
  end
end
