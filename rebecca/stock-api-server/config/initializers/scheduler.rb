require 'rufus-scheduler'

s = Rufus::Scheduler.singleton

if ENV['RAILS_ENV'] == 'development' || ENV['RAILS_ENV'] == 'production'
  s.in '1s' do
    Stock.load_data
  end

  s.every '1d' do
    Stock.load_data
  end
end

def s.on_error(job, error)
  Rails.logger.error(
    "err#{error.object_id} rufus-scheduler intercepted #{error.inspect}" \
    " in job #{job.inspect}"
  )
  error.backtrace.each_with_index do |line, i|
    Rails.logger.error(
      "err#{error.object_id} #{i}: #{line}"
    )
  end
end
