node[:deploy].each do |application, deploy|

  deploy_to = node[:deploy][application][:deploy_to]
  current_deploy_path = Dir["#{deploy_to}/releases/*"].max_by { |f| File.mtime(f) }
  procfile_path = "#{current_deploy_path}/Procfile"

  clock_command = nil

  if File.exist?(procfile_path)

    f = File.open(procfile_path)

    pattern = /^clock: (?<command>.+)$/

    f.each do |line|
      if match = line.match(pattern)
        clock_command = match['command']
        break
      end
    end

    f.close
  end

  if clock_command
    template "#{node[:monit][:conf_dir]}/clock_#{application}.monitrc" do
      owner 'root'
      group 'root'
      mode 0644
      source "monitrc.conf.erb"
      variables({
        command: clock_command,
        app_name: application,
        app_path: deploy[:deploy_to],
        process_type: 'clock',
        process_count: 1
      })
    end

    execute "Reload monit" do
      command %Q{
        monit reload
      }
    end

    execute "Restart clock" do
      command %Q{
        echo "sleep 20 && monit -g clock_#{application} restart all" | at now
      }
    end

  else
    execute "Stop clock" do
      command %Q{
        monit -g clock_#{application} stop all
      }
    end

    file "#{node[:monit][:conf_dir]}/clock_#{application}.monitrc" do
      action :delete
    end

    execute "Reload monit" do
      command %Q{
        monit reload
      }
    end
  end
end
