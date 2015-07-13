case node['platform']
when 'debian', 'ubuntu'

  bash 'locale-gen zh_TW.UTF-8' do
    user 'root'
    code <<-EOH
      locale-gen zh_TW.UTF-8
    EOH
  end
end
