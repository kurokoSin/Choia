#｛app_name｝の箇所はご自身のファイルパスを記述してください。
worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3)
timeout 15
preload_app true
 
listen "#{ENV["HOME"]}/Choia/Core/tmp/sockets/unicorn.sock"
pid    "#{ENV["HOME"]}/Choia/Core/tmp/pids/server.pid"
 
before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end
 
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end
 
after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end
 
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
 
stderr_path File.expand_path('log/unicorn.log', ENV['RAILS_ROOT'])
stdout_path File.expand_path('log/unicorn.log', ENV['RAILS_ROOT'])

# Reference:
# 【Ruby on Rails】unicornをNginx環境下で動かす時の設定方法
# https://y-hilite.com/2857/
# https://qiita.com/noraworld/items/c8acf4bb981c8d8535df
