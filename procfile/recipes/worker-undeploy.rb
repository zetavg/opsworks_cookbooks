node[:deploy].each do |application, _deploy|

  execute "Stop worker" do
    command %Q{
      monit -g worker_#{application} stop all
    }
  end

  file "#{node[:monit][:conf_dir]}/worker_#{application}.monitrc" do
    action :delete
  end

  execute "Reload monit" do
    command %Q{
      monit reload
    }
  end
end
