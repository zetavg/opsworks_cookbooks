syslogdir = "/etc/rsyslog.d"

10.times do |i|
  file "#{syslogdir}/9000-opsworks-event-watch-file-#{i}.conf" do
    action :create_if_missing
    content ''
    owner "root"
    group "root"
    mode "0644"
  end
end

template '/bin/rsyslog_opswork_event.rb' do
  source "rsyslog_opswork_event.rb"
  owner "root"
  group "root"
  mode "0755"
end

template "#{node[:monit][:conf_dir]}/rsyslog_opswork_event.monitrc" do
  owner 'root'
  group 'root'
  mode 0644
  source "monitrc.conf.erb"
  variables({
    name: 'rsyslog_opswork_event',
    command: 'ruby /bin/rsyslog_opswork_event.rb',
    app_name: 'rsyslog_opswork_event',
    pidfile: '/tmp/rsyslog_opswork_event.pid',
    group: 'rsyslog_opswork_event'
  })
end

execute "Reload monit" do
  command %Q{
    monit reload
  }
end

execute "Restart rsyslog_opswork_event" do
  command %Q{
    echo "sleep 20 && monit -g rsyslog_opswork_event restart all" | at now
  }
end
