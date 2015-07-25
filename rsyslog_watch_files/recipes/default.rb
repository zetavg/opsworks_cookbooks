require 'digest/sha1'
syslogdir = "/etc/rsyslog.d"
syslogger = "rsyslog"

if node['rsyslog']['watch_files'] && node['rsyslog']['watch_files'].length > 0
  watch_files_array = []

  if node['rsyslog']['watch_files'].respond_to?(:keys)

    node['rsyslog']['watch_files'].each do |file_name, tag|
      watch_files_array << {
        file_name: file_name,
        tag:      tag,
        sha:      Digest::SHA1.hexdigest(file_name)
      }
    end

    # Sort to preserve order of the config
    watch_files_array = watch_files_array.sort { |a, b| a[:file_name] <=> b[:file_name] }
  end

  template "#{syslogdir}/1000-watch-files.conf" do
    source "watch-files.conf.erb"
    owner "root"
    group "root"
    mode "0644"
    variables(watch_files: watch_files_array)
    notifies :restart, resources(service: syslogger)
  end
end
