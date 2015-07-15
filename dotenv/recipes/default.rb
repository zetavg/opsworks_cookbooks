#
# Cookbook Name:: dotenv
# Recipe:: default
#

node[:deploy].each do |application, deploy|
  environment_variables = deploy[:environment_variables]
  next unless environment_variables

  Chef::Log.debug("Generating .env for #{application}")

  template "#{node[:deploy][application][:deploy_to]}/shared/.env" do
    source ".env.erb"
    mode 0644
    owner deploy[:user]
    group deploy[:group]
    variables(environment_variables: Dotenv::Escape.escape_double_quotes(environment_variables))
  end
end
