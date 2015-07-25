bash 'opsrp_setapp' do
  user 'root'
  code <<-EOH
    echo 'alias sa=". /scripts/set-app.sh"' >> /etc/bash.bashrc
    echo 'alias sa=". /scripts/set-app.sh"' >> /etc/profile
    mkdir -p /scripts
    curl -L http://git.io/opsrp_setapp > /scripts/set-app.sh
    chmod 755 /scripts/set-app.sh
  EOH
  not_if { ::File.exist?('/scripts/set-app.sh') }
end
