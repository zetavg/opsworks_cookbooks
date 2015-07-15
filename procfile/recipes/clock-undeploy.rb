node[:deploy].each do |application, _deploy|

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
