desc "Show server uptime"
task :uptime do
  on roles(:all) do |host|
    uptime = capture('uptime')
    info "#{host} uptime: #{uptime}"
  end
end
