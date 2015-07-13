require 'json'

node[:deploy].each do |application, deploy|

  data = Hash[node[:opsworks][:instance]]
  data.delete_if { |k, v| ![:id, :hostname, :instance_type, :public_dns_name, :private_dns_name, :ip, :private_ip, :architecture, :layers, :backends, :aws_instance_id, :region, :availability_zone, :subnet_id, :infrastructure_class].include?(k.to_sym) }
  data[:event] = 'Undeploy'
  data[:application] = application
  data[:deploy] = Hash[deploy]
  data[:deploy].delete_if { |k, v| [:deploy_to, :chef_provider, :keep_releases, :current_path, :document_root, :ignore_bundler_groups, :absolute_document_root, :rake, :migrate, :migrate_command, :rails_env, :action, :user, :group, :shell, :home, :sleep_before_restart, :stack, :enable_submodules, :shallow_clone, :delete_cached_copy, :purge_before_symlink, :create_dirs_before_symlink, :symlink_before_migrate, :symlinks, :ssl_support, :auto_npm_install_on_deploy, :nodejs, :application, :application_type, :auto_bundle_on_deploy, :deploying_user, :domains, :mounted_at, :restart_command, :scm, :scm_type, :repository].include?(k.to_sym) }
  data_json = data.to_json

  node['webhooks_undeploy_url'].each do |url|

    http_request "post data to specified URL" do
      action :post
      url url
      message data_json
      headers("Content-Type" => "application/json")
    end

  end if node['webhooks_undeploy_url'].is_a?(Array)
end
