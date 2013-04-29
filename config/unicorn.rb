worker_processes 3
timeout 30
preload_app true

before_fork do |server, worker|
  Signal.trap 'TERM' do
    Rails.logger.info 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  ActiveRecord::Base.connection.disconnect!
  Rails.logger.info 'Disconnected from ActiveRecord'

  sleep 1
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    Rails.logger.info 'Unicorn worker intercepting TERM and doing nothing. Wait for master to sent QUIT'
  end

  ActiveRecord::Base.establish_connection
  Rails.logger.info 'Connected to ActiveRecord'
end
