require 'digest/sha1'

syslogdir = "/etc/rsyslog.d"

last_log_path = nil

loop do
  sleep 15
  log_path = Dir['/var/lib/aws/opsworks/chef/*.log'].max_by { |f| File.mtime(f) }
  next if log_path == last_log_path
  last_log_path = log_path
  rsyslog_conf_path = Dir["#{syslogdir}/9000-opsworks-event-watch-file-*.conf"].min_by { |f| File.mtime(f) }

  conf = <<-EOF
$ModLoad imfile

$InputFileName #{log_path}
$InputFileTag opsworks_event
$InputFileStateFile opsworks_event_watch_state_file_#{Digest::SHA1.hexdigest(rsyslog_conf_path)}
$InputFilePollInterval 10
$InputRunFileMonitor
  EOF

  `echo "#{conf.gsub('$', '\$')}" > #{rsyslog_conf_path}`
  `service rsyslog restart`
end
